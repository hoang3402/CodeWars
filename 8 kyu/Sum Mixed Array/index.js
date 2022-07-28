function sumMix(x) {
    return x.reduce((a, b) => (a - 0) + (b - 0), 0);
}

function sumMix(x) {
    return x.map(a => +a).reduce((a, b) => a + b);
}

function sumMix(x) {
    let result = 0;
    for (let n of x) {
        result += parseInt(n);
    }
    return result;
}

const sumMix = x => x.reduce((a, b) => +b + a, 0)
