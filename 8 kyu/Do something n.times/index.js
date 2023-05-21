Number.prototype.times = function (f) {
    for (let i = 0; i < this; i++) {
        f(i);
    }
}

console.log((6).times(_ => {
    console.log(1);
}))