function lastDigit(as) {
    return as.reduceRight((prev, curr, i) => {
        let exp = prev < 4 ? prev : (prev % 4 + 4);

        let base = i === 0 ?
                            (curr % 10) :
                            (curr < 4 ? curr : (curr % 4 + 4));

        return Math.pow(base, exp);
    }, 1) % 10;
}