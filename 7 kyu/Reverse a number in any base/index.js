function reverseNumber(n, b) {
    if (b == 1) return n;
    n = BigInt(n);
    b = BigInt(b);
    var stack = []

    while (n > 0) {
        stack.push(BigInt(n) % BigInt(b))
        n = n / b
    }
    let dec = BigInt(0);
    for (let i = stack.length - 1; i >= 0; i--) {
        dec += stack[i] * (b ** BigInt(stack.length - 1 - i));
    }
    return dec;
}

function reverseNumber(n, b) {
    if (b === 1n) return n;
    let res = 0n;
    while (n > 0n) {
        res = res * b + n % b;
        n /= b;
    }
    return res;
}