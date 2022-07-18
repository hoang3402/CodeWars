var isPP = function (n) {

    var m = Math.sqrt(n) + 1;
    for (var i = 2; i <= m; i++) {
        if (isDivisible(i, n)) {
            var power = check(i, n);
            if (power != null) {
                return [i, power];
            }
        }
    }
    return null;
}

function check(i, n) {
    var power = 1;
    accumulator = i;
    while (accumulator <= n) {
        if (accumulator === n) { return power; }
        power++;
        accumulator = Math.pow(i, power);
    }
}

function isDivisible(i, n) {
    return (n / i) - Math.floor(n / i) === 0;
}
//
function isPP(n) {
    for (var m = 2; m * m <= n; ++m)
        for (var k = 2; Math.pow(m, k) <= n; ++k)
            if (Math.pow(m, k) == n) return [m, k];
    return null;
}
//
var isPP = function (n) {
    for (var m = 2; m <= Math.floor(Math.sqrt(n)); ++m) {
        var k = Math.round(Math.log(n) / Math.log(m))
        if (Math.pow(m, k) == n) return [m, k];
    }
    return null;
}
//
var isPP = function (n) {
    var res = null, x = 1, p;
    while (x++ < n && !res) {
        p = Math.round(Math.pow(n, 1 / x));
        if (Math.pow(p, x) == n) res = [p, x]
    }
    return res
}