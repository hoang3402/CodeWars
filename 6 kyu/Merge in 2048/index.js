function merge(line) {
    var lenght = line.length;
    line = line.filter(e => e)

    for (var i = 0; i < line.length; i++) {
        if (line[i] == line[i + 1]) {
            line[i] *= 2;
            line[i + 1] = 0;
            line = line.filter(e => e)
        }
    }

    for (var i = line.length; i < lenght; i++) {
        line.push(0);
    }

    return line;
}

function merge(line) {
    const zeroes = []
    const merged = []

    let prev = null
    line.forEach((curr, index) => {
        if (curr === 0) {
            zeroes.push(0)
            return
        }

        if (prev !== curr) {
            merged.push(curr)
            prev = curr
        } else {
            merged[merged.length - 1] *= 2
            zeroes.push(0)
            prev = null
        }
    })

    return [...merged, ...zeroes]
};

function merge(line) {
    if (line.length < 2) return line
    if (line[0] === 0) return [...merge(line.slice(1)), 0]
    if (line[1] === 0) return [...merge([line[0], ...line.slice(2)]), 0]
    if (line[0] === line[1]) return [line[0] * 2, ...merge(line.slice(2)), 0]
    return [line[0], ...merge(line.slice(1))]
};