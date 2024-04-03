function dec2bin(dec) {
    return (dec >>> 0).toString(2).padStart(8, '0');
}

function bitMarch(n) {
    const result = [];
    let _n = 2 ** n - 1;
    for (let i = 0; i < 8 - n + 1; i++) {
        const _temp = dec2bin(_n);
        const _result = _temp.split('').map((x) => Number(x));
        result.push(_result);
        _n = _n << 1;
    }
    return result;
}
