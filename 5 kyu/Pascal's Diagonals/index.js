function generateDiagonal(n, l) {
    var result = [];
    for (i = 0; i < l; i++, n++) {
        result.push(Math.round(P(n, i)));
    }
    return result;
}

function P(n, k) {
    return (factorial(n) / (factorial(k) * factorial(n - k)));
}

function factorial(n) {
    if (n == 0) {
        return 1;
    }
    return n * factorial(n - 1);
}

////////////////////////////////

function generateDiagonal(n, l) {
    let arr = Array(l).fill(1)
    for (let i = 0; i < n; ++i) {
        for (let j = 1; j < l; ++j) {
            arr[j] += arr[j - 1]
        }
    }
    return arr
}

////////////////////////////////

function generateDiagonal(n, l) {
    let r = Array(l).fill(1)
    while (n--) for (let i = 1; i < l; i++) r[i] += r[i - 1]
    return r
}

////////////////////////////////

const factorial = n => n ? BigInt(n) * factorial(n - 1) : 1n;
const pascalXY = (x, y) => Number(factorial(x + y) / factorial(x) / factorial(y));
const generateDiagonal = (n, l) => l ? [...generateDiagonal(n, l - 1), pascalXY(n, l - 1)] : [];

////////////////////////////////

function generateDiagonal(n, l) {
    for (var i = 1, arr = []; i < l; i++) {
        arr[0] = 1;
        arr.push((n + i) * arr[i - 1] / i);
    } return arr;
}