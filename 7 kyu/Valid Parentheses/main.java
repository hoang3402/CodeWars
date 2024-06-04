import java.util.Stack;

public class Kata {
  
  public static boolean validParentheses(String parenStr) {
		int lenght = parenStr.length();

		if (lenght % 2 != 0) {
				return false;
		}

		Stack<Character> stack = new Stack<>();

		for (int i = 0; i < lenght; i++) {
				if (parenStr.charAt(i) == '(') {
						stack.push(')');
				} else if (parenStr.charAt(i) == '{') {
						stack.push('}');
				} else if (parenStr.charAt(i) == '[') {
						stack.push(']');
				} else if (stack.isEmpty() || stack.pop() != parenStr.charAt(i)) {
						return false;
				}
		}

		return stack.isEmpty();
  }
}