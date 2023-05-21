function smallEnough(a, limit) {
    return a.every(x => x <= limit);
}

function smallEnough(a, limit) {
    return Math.max(...a) <= limit
}