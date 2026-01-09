import java.io.*;
import java.util.*;


class VmContext {
    public Stack<Long> stack = new Stack<>();
    public Map<Integer, Long> heap = new HashMap<>();
    public Stack<Integer> callStack = new Stack<>();
    public BufferedReader input;
    public StringBuilder output = new StringBuilder();
    public OutputStream outStream;

    // Instruction Pointer (Con trỏ lệnh)
    public int ip = 0;

    public boolean running = true;

    public VmContext(InputStream in) {
        this.input = (in != null) ? new BufferedReader(new InputStreamReader(in)) : null;
    }

    public VmContext(InputStream in, OutputStream out) {
        this.input = (in != null) ? new BufferedReader(new InputStreamReader(in)) : null;
        this.outStream = out;
    }

    public long pop() {
        if (stack.isEmpty()) throw new RuntimeException("Empty stack");
        return stack.pop();
    }

    public void push(long val) {
        stack.push(val);
    }

    public void writeOutput(String s) {
        output.append(s);

        if (outStream != null) {
            try {
                for (char c : s.toCharArray()) {
                    outStream.write(c);
                }
                outStream.flush();
            } catch (IOException e) {
                throw new RuntimeException("Output stream error", e);
            }
        }
    }
}

interface Instruction {
    void execute(VmContext ctx);
}

class PushInstruction implements Instruction {
    private final long value; // Giá trị được parse từ trước

    public PushInstruction(long value) {
        this.value = value;
    }

    @Override
    public void execute(VmContext ctx) {
        ctx.push(value);
    }
}

class AddInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long a = ctx.pop();
        long b = ctx.pop();
        ctx.push(b + a);
    }
}

class SubInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long a = ctx.pop();
        long b = ctx.pop();
        ctx.push(b - a);
    }
}

class MulInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long a = ctx.pop();
        long b = ctx.pop();
        ctx.push(b * a);
    }
}

class DivInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long b = ctx.pop(); // Số chia (Divisor)
        long a = ctx.pop(); // Số bị chia (Dividend)
        if (b == 0) throw new RuntimeException("Division by zero");
        ctx.push(Math.floorDiv(a, b));
    }
}

class ModInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long b = ctx.pop();
        long a = ctx.pop();
        if (b == 0) throw new RuntimeException("Modulo by zero");
        ctx.push(Math.floorMod(a, b));
    }
}

class DupInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long val = ctx.pop();
        ctx.push(val);
        ctx.push(val);
    }
}

class CopyInstruction implements Instruction {
    private final int index;

    public CopyInstruction(int index) {
        this.index = index;
    }

    @Override
    public void execute(VmContext ctx) {
        if (ctx.stack.size() <= index) throw new RuntimeException("Stack underflow");
        long val = ctx.stack.get(ctx.stack.size() - 1 - index);
        ctx.push(val);
    }
}

class SwapInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long a = ctx.pop();
        long b = ctx.pop();
        ctx.push(a);
        ctx.push(b);
    }
}

class DiscardInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        ctx.pop();
    }
}

class SlideInstruction implements Instruction {
    private final int count;

    public SlideInstruction(int count) {
        this.count = count;
    }

    @Override
    public void execute(VmContext ctx) {
        if (ctx.stack.isEmpty()) throw new RuntimeException("Stack empty");
        long top = ctx.pop();

        if (count < 0 || count >= ctx.stack.size()) {
            ctx.stack.clear();
        } else {
            for (int i = 0; i < count; i++) {
                ctx.stack.pop();
            }
        }

        ctx.push(top);
    }
}

class StoreInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long value = ctx.pop();
        int address = (int) ctx.pop();
        ctx.heap.put(address, value);
    }
}

class RetrieveInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        int address = (int) ctx.pop();
        if (!ctx.heap.containsKey(address)) throw new RuntimeException("Heap address not found");
        ctx.push(ctx.heap.get(address));
    }
}

class OutputCharInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long val = ctx.pop();
        char c = (char) val;
        ctx.writeOutput(String.valueOf(c));
    }
}

class OutputNumInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        long val = ctx.pop();
        ctx.writeOutput(String.valueOf(val));
    }
}

class InputCharInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        try {
            int address = (int) ctx.pop();
            int ch = ctx.input.read();
            if (ch == -1) {
                throw new RuntimeException("End of input");
            }
            ctx.heap.put(address, (long) ch);
        } catch (Exception e) {
            throw new RuntimeException("Input error", e);
        }
    }
}

class InputNumInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        try {
            int address = (int) ctx.pop();
            String line = ctx.input.readLine();
            if (line == null) {
                throw new RuntimeException("End of input");
            }
            try {
                if (line.trim().isEmpty()) throw new NumberFormatException();
                long num = Long.parseLong(line.trim());
                ctx.heap.put(address, num);
            } catch (NumberFormatException e) {
                throw new RuntimeException("Invalid number format");
            }
        } catch (Exception e) {
            throw new RuntimeException("Input error", e);
        }
    }
}

class MarkInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        // Label marker, no operation at runtime
    }
}

class CallInstruction implements Instruction {
    private final String label;
    private final Map<String, Integer> labelMap;

    public CallInstruction(String label, Map<String, Integer> labelMap) {
        this.label = label;
        this.labelMap = labelMap;
    }

    @Override
    public void execute(VmContext ctx) {
        if (!labelMap.containsKey(label)) throw new RuntimeException("Label not found");
        ctx.callStack.push(ctx.ip);
        ctx.ip = labelMap.get(label);
    }
}

class JumpIfZeroInstruction implements Instruction {
    private final String label;
    private final Map<String, Integer> labelMap;

    public JumpIfZeroInstruction(String label, Map<String, Integer> labelMap) {
        this.label = label;
        this.labelMap = labelMap;
    }

    @Override
    public void execute(VmContext ctx) {
        long val = ctx.pop();
        if (val == 0) {
            if (!labelMap.containsKey(label)) throw new RuntimeException("Label not found");
            ctx.ip = labelMap.get(label);
        }
    }
}

class JumpIfNegativeInstruction implements Instruction {
    private final String label;
    private final Map<String, Integer> labelMap;

    public JumpIfNegativeInstruction(String label, Map<String, Integer> labelMap) {
        this.label = label;
        this.labelMap = labelMap;
    }

    @Override
    public void execute(VmContext ctx) {
        long val = ctx.pop();
        if (val < 0) {
            if (!labelMap.containsKey(label)) throw new RuntimeException("Label not found");
            ctx.ip = labelMap.get(label);
        }
    }
}

class ReturnInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        if (ctx.callStack.isEmpty()) throw new RuntimeException("Return without call");
        ctx.ip = ctx.callStack.pop();
    }
}

class EndInstruction implements Instruction {
    @Override
    public void execute(VmContext ctx) {
        ctx.running = false;
    }
}

class JumpInstruction implements Instruction {
    private final String label;
    private final Map<String, Integer> labelMap;

    public JumpInstruction(String label, Map<String, Integer> labelMap) {
        this.label = label;
        this.labelMap = labelMap;
    }

    @Override
    public void execute(VmContext ctx) {
        if (!labelMap.containsKey(label)) throw new RuntimeException("Label not found");
        ctx.ip = labelMap.get(label);
    }
}

class ErrorInstruction implements Instruction {
    private String message;

    public ErrorInstruction(String message) {
        this.message = message;
    }

    @Override
    public void execute(VmContext ctx) {
        throw new RuntimeException(message);
    }
}

class Parser {
    private char[] code;
    private int pos = 0;
    private final Map<String, Integer> labelMap = new HashMap<>();

    // transforms space characters to ['s','t','n'] chars;
    public static String unbleach(String code) {
        return code != null ? code.replace(' ', 's').replace('\t', 't').replace('\n', 'n') : null;
    }

    public List<Instruction> parse(String rawCode) {
        String clean = rawCode.replaceAll("[^ \t\n]", "");
        this.code = unbleach(clean).toCharArray();
        this.pos = 0;
        this.labelMap.clear();

        List<Instruction> instructions = new ArrayList<>();

        while (pos < code.length) {
            int currentIndex = instructions.size();

            // IMP: [Space] - Stack Manipulation
            if (match("s")) {
                if (match("s")) {
                    long num = readNumber();
                    instructions.add(new PushInstruction(num));
                } else if (match("ts")) {
                    int idx = (int) readNumber();
                    instructions.add(new CopyInstruction(idx));
                } else if (match("tn")) {
                    int count = (int) readNumber();
                    instructions.add(new SlideInstruction(count));
                } else if (match("ns")) {
                    instructions.add(new DupInstruction());
                } else if (match("nt")) {
                    instructions.add(new SwapInstruction());
                } else if (match("nn")) {
                    instructions.add(new DiscardInstruction());
                } else {
                    instructions.add(new ErrorInstruction("Invalid Stack Command"));
                }
            }
            // IMP: [Tab][Space] - Arithmetic
            else if (match("ts")) {
                if (match("ss")) instructions.add(new AddInstruction());
                else if (match("st")) instructions.add(new SubInstruction());
                else if (match("sn")) instructions.add(new MulInstruction());
                else if (match("ts")) instructions.add(new DivInstruction());
                else if (match("tt")) instructions.add(new ModInstruction());
                else instructions.add(new ErrorInstruction("Invalid Arithmetic Command"));
            }
            // IMP: [Tab][Tab] - Heap Access
            else if (match("tt")) {
                if (match("s")) instructions.add(new StoreInstruction());
                else if (match("t")) instructions.add(new RetrieveInstruction());
                else instructions.add(new ErrorInstruction("Invalid Heap Command"));
            }
            // IMP: [Tab][LineFeed] - I/O
            else if (match("tn")) {
                if (match("ss")) instructions.add(new OutputCharInstruction());
                else if (match("st")) instructions.add(new OutputNumInstruction());
                else if (match("ts")) instructions.add(new InputCharInstruction());
                else if (match("tt")) instructions.add(new InputNumInstruction());
                else instructions.add(new ErrorInstruction("Invalid I/O Command"));
            }
            // IMP: [LineFeed] - Flow Control
            else if (match("n")) {
                if (match("ss")) {
                    String label = readLabel();
                    if (labelMap.containsKey(label)) {
                        instructions.add(new ErrorInstruction("Repeated label"));
                    } else {
                        labelMap.put(label, currentIndex);
                        instructions.add(new MarkInstruction());
                    }
                } else if (match("st")) {
                    String label = readLabel();
                    instructions.add(new CallInstruction(label, labelMap));
                } else if (match("sn")) {
                    String label = readLabel();
                    instructions.add(new JumpInstruction(label, labelMap));
                } else if (match("ts")) {
                    String label = readLabel();
                    instructions.add(new JumpIfZeroInstruction(label, labelMap));
                } else if (match("tt")) {
                    String label = readLabel();
                    instructions.add(new JumpIfNegativeInstruction(label, labelMap));
                } else if (match("tn")) {
                    instructions.add(new ReturnInstruction());
                } else if (match("nn")) {
                    instructions.add(new EndInstruction());
                } else {
                    instructions.add(new ErrorInstruction("Invalid Flow Command"));
                }
            } else {
                instructions.add(new ErrorInstruction("Invalid Flow Command"));
            }
        }
        return instructions;
    }

    private boolean match(String pattern) {
        if (pos + pattern.length() > code.length) return false;
        for (int i = 0; i < pattern.length(); i++) {
            if (code[pos + i] != pattern.charAt(i)) return false;
        }
        pos += pattern.length();
        return true;
    }

    private long readNumber() {
        if (pos >= code.length) throw new RuntimeException("Expected number");
        boolean negative;
        if (code[pos] == 's') {
            negative = false;
            pos++;
        } else if (code[pos] == 't') {
            negative = true;
            pos++;
        } else {
            throw new RuntimeException("Invalid number sign");
        }

        StringBuilder binary = new StringBuilder();
        while (pos < code.length && code[pos] != 'n') {
            if (code[pos] == 's') {
                binary.append('0');
            } else if (code[pos] == 't') {
                binary.append('1');
            }
            pos++;
        }
        if (pos >= code.length || code[pos] != 'n') {
            throw new RuntimeException("Number not terminated");
        }
        pos++; // consume 'n'

        long value = !binary.isEmpty() ? Long.parseLong(binary.toString(), 2) : 0;
        return negative ? -value : value;
    }

    private String readLabel() {
        StringBuilder label = new StringBuilder();
        while (pos < code.length && code[pos] != 'n') {
            label.append(code[pos]);
            pos++;
        }
        if (pos >= code.length || code[pos] != 'n') {
            throw new RuntimeException("Label not terminated");
        }
        pos++; // consume 'n'
        return label.toString();
    }
}

public class WhitespaceInterpreter {

    // transforms space characters to ['s','t','n'] chars;
    public static String unbleach(String code) {
        return code != null ? code.replace(' ', 's').replace('\t', 't').replace('\n', 'n') : null;
    }

    // solution
    public static String execute(String code, InputStream input) {
        VmContext context = new VmContext(input);
        Parser parser = new Parser();

        List<Instruction> program = parser.parse(code);

        try {
            while (context.running && context.ip < program.size()) {
                Instruction cmd = program.get(context.ip);
                int prevIp = context.ip;
                context.ip++;

                cmd.execute(context);
            }
        } catch (Exception e) {
            throw new RuntimeException("Runtime Error", e);
        }

        return context.output.toString();
    }

    public static String execute(String code, InputStream input, OutputStream outputStream) {
        VmContext context = new VmContext(input, outputStream);
        Parser parser = new Parser();

        List<Instruction> program = parser.parse(code);

        if (outputStream != null) {
            try {
                outputStream.flush();
            } catch (IOException e) {
            }
        }

        try {
            while (context.running && context.ip < program.size()) {
                Instruction cmd = program.get(context.ip);
                context.ip++;
                cmd.execute(context);
            }
        } catch (Exception e) {
            throw new RuntimeException("Runtime Error", e);
        }

        if (context.running) {
            throw new RuntimeException("Unclean termination");
        }

        if (outputStream != null) {
            try {
                outputStream.flush();
            } catch (IOException e) {
            }
        }

        return context.output.toString();
    }

}
