function fib(n) {
    let bigN = BigInt(n);
    if (bigN === 0n) return 0n;
    if (bigN === 1n || bigN === 2n) return 1n;
    if (bigN < 0n) {
        let result = fib(-bigN);
        return bigN % 2n === 0n ? -result : result;
    }

    let result = powMatrix([[1n, 1n], [1n, 0n]], bigN);

    return result[0][1];
}

function powMatrix(base, exponent) {
    let result = [[1n, 0n], [0n, 1n]];
    let a = base;

    while (exponent > 0n) {
        if (exponent % 2n === 1n) {
            result = multiplyMatrix(result, a);
        }
        a = multiplyMatrix(a, a);
        exponent /= 2n;
    }

    return result;
}

function multiplyMatrix(a, b) {
    return [
        [
            a[0][0] * b[0][0] + a[0][1] * b[1][0],
            a[0][0] * b[0][1] + a[0][1] * b[1][1]
        ],
        [
            a[1][0] * b[0][0] + a[1][1] * b[1][0],
            a[1][0] * b[0][1] + a[1][1] * b[1][1]
        ]
    ];
}

// ===
const fib = n =>
    (fn => n < 0 && !(n % 2) ? -fn(Math.abs(n))[0] : fn(Math.abs(n))[0])
        (function fn(n) {
            if (!n) return [0n, 1n];
            const [_n, _n1] = fn(n >> 1);
            const _2n = _n * (2n * _n1 - _n);
            const _2n1 = _n ** 2n + _n1 ** 2n;
            return n % 2 ? [_2n1, _2n + _2n1] : [_2n, _2n1];
        });

// ===
// Credits:
// - https://www.codewars.com/kata/5d1eae23c193ae0025b5d50b
// - https://en.wikipedia.org/wiki/Generalizations_of_Fibonacci_numbers#Extension_to_negative_integers
const fib = (() => {
    const fib2 = n => {
        if (n === 0)
            return [0n, 1n];
        const [a, b] = fib2(Math.floor(n / 2));
        const [c, d] = [a * (2n * b - a), a * a + b * b];
        return n % 2 === 0 ? [c, d] : [d, c + d];
    };
    return n => n < 0 && n % 2 === 0 ? -fib2(-n)[0] : fib2(Math.abs(n))[0];
})();