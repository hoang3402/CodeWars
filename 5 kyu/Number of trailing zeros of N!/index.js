function zeros(n) {
    if (n < 5) return 0;
    return Math.floor(zeros(n / 5) + n / 5);
}

function zeros(n) {
    var zs = 0;
    while (n > 0) {
        n = Math.floor(n / 5);
        zs += n
    }
    return zs;
}