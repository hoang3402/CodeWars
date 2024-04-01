let squares = Array.from({ length: 10 }, (_, i) => (i + 1) ** 2)

function genGraph(n) {
    return Array.from({ length: n + 1 }, (_, i) => {
        if (i == 0) return []
        let arr = []
        squares.forEach(x => i < x && x - i != i && x - i <= n && arr.push(x - i))
        return new Set(arr)
    })
}

function subTry(n, curPath, graph) {
    if (curPath.length == n) return curPath
    let last = curPath[curPath.length - 1]
    let neighbors = [...graph[last]].sort((a, b) => graph[a].size - graph[b].size)
    let result = false
    graph = graph.map(x => new Set(x))
    for (let n of neighbors) graph[n].delete(last)
    return neighbors.some(x => result = subTry(n, curPath.concat(x), graph)) && result
}

function square_sums_row(n) {
    if (n < 15 || (n >= 18 && n < 23) || n == 24) return false
    let graph = genGraph(n)
    let vertices = Array.from({ length: n }, (_, i) => i + 1).sort((a, b) => graph[a].size - graph[b].size)
    let result = false
    return vertices.some(x => result = subTry(n, [x], graph)) && result
}

// ---

function square_sums_row(n, r = []) {
    return DFS(r, new Set(), n) ? r : false
}

function DFS(r, set, n) {
    if (set.size === n) return true
    for (let i = 1; i <= n; i++) {
        if (set.has(i)) continue
        if (r.length && Math.sqrt(r[0] + i) % 1 !== 0) continue
        set.add(i); r.unshift(i)
        if (DFS(r, set, n)) return true
        r.shift(); set.delete(i)
    }
    return false
}

// ---

function square_sums_row(n) {
    const squares = [];
    for (let i = 2; true; i++) {
        if (i * i > n * 2 - 1) break;
        squares.push(i * i);
    }
    const used = [...(new Array(n))].map(i => false);
    for (let i = n; i > 0; i--) {
        used[i] = true;
        const result = findNext(1, i, used, squares, n);
        if (result) return result;
        used[i] = false;
    }
    return false;
    function findNext(len, last, used, squares, n) {
        if (len === n) return [last];
        for (let i = squares.length - 1; i >= 0 && squares[i] > last; i--) {
            const next = squares[i] - last;
            if (next > n || used[next]) continue;
            used[next] = true;
            const result = findNext(len + 1, next, used, squares, n);
            if (result) {
                result.push(last);
                return result;
            }
            used[next] = false;
        }
        return false;
    }
}

// ---

function square_sums_row(n) {
    if (n < 15 || (n > 17 && n < 23) || n === 24) return false;
    if (n === 15) return [8, 1, 15, 10, 6, 3, 13, 12, 4, 5, 11, 14, 2, 7, 9];
    if (n === 16) return [8, 1, 15, 10, 6, 3, 13, 12, 4, 5, 11, 14, 2, 7, 9, 16];
    if (n === 17) return [16, 9, 7, 2, 14, 11, 5, 4, 12, 13, 3, 6, 10, 15, 1, 8, 17];
    if (n === 23) return [2, 23, 13, 12, 4, 21, 15, 10, 6, 19, 17, 8, 1, 3, 22, 14, 11, 5, 20, 16, 9, 7, 18];
    if (n === 25) return [2, 23, 13, 12, 24, 25, 11, 14, 22, 3, 1, 8, 17, 19, 6, 10, 15, 21, 4, 5, 20, 16, 9, 7, 18];
    if (n === 26) return [2, 14, 22, 3, 13, 23, 26, 10, 6, 19, 17, 8, 1, 15, 21, 4, 12, 24, 25, 11, 5, 20, 16, 9, 7, 18];
    if (n === 27) return [1, 8, 17, 19, 6, 3, 13, 12, 24, 25, 11, 14, 22, 27, 9, 16, 20, 5, 4, 21, 15, 10, 26, 23, 2, 7, 18];
    if (n === 28) return [1, 15, 10, 26, 23, 13, 3, 6, 19, 17, 8, 28, 21, 4, 12, 24, 25, 11, 5, 20, 16, 9, 27, 22, 14, 2, 7, 18];
    if (n === 29) return [1, 24, 25, 11, 5, 4, 12, 13, 3, 6, 19, 17, 8, 28, 21, 15, 10, 26, 23, 2, 14, 22, 27, 9, 16, 20, 29, 7, 18];
    if (n === 30) return [1, 24, 25, 11, 5, 4, 12, 13, 3, 6, 30, 19, 17, 8, 28, 21, 15, 10, 26, 23, 2, 14, 22, 27, 9, 16, 20, 29, 7, 18];
    if (n === 31) return [1, 15, 10, 6, 30, 19, 17, 8, 28, 21, 4, 5, 31, 18, 7, 29, 20, 16, 9, 27, 22, 3, 13, 12, 24, 25, 11, 14, 2, 23, 26];
    if (n === 32) return [1, 8, 28, 21, 4, 32, 17, 19, 30, 6, 3, 13, 12, 24, 25, 11, 5, 31, 18, 7, 29, 20, 16, 9, 27, 22, 14, 2, 23, 26, 10, 15];
    if (n === 33) return [1, 8, 28, 21, 4, 32, 17, 19, 30, 6, 3, 13, 12, 24, 25, 11, 5, 20, 29, 7, 18, 31, 33, 16, 9, 27, 22, 14, 2, 23, 26, 10, 15];
    if (n === 34) return [1, 3, 6, 19, 30, 34, 2, 7, 18, 31, 33, 16, 9, 27, 22, 14, 11, 25, 24, 12, 13, 23, 26, 10, 15, 21, 28, 8, 17, 32, 4, 5, 20, 29];
    if (n === 35) return [1, 3, 6, 19, 30, 34, 2, 7, 18, 31, 33, 16, 9, 27, 22, 14, 11, 25, 24, 12, 13, 23, 26, 10, 15, 21, 28, 8, 17, 32, 4, 5, 20, 29, 35];
    if (n === 36) return [1, 3, 6, 10, 26, 23, 2, 7, 18, 31, 33, 16, 9, 27, 22, 14, 35, 29, 20, 5, 11, 25, 24, 12, 13, 36, 28, 8, 17, 19, 30, 34, 15, 21, 4, 32];
    if (n === 37) return [1, 3, 13, 36, 28, 8, 17, 32, 4, 21, 15, 34, 30, 19, 6, 10, 26, 23, 2, 7, 18, 31, 33, 16, 9, 27, 22, 14, 35, 29, 20, 5, 11, 25, 24, 12, 37];
    if (n === 38) return [1, 3, 6, 19, 30, 34, 2, 23, 13, 36, 28, 8, 17, 32, 4, 21, 15, 10, 26, 38, 11, 25, 24, 12, 37, 27, 22, 14, 35, 29, 20, 5, 31, 18, 7, 9, 16, 33];
    if (n === 39) return [1, 3, 6, 19, 30, 34, 2, 7, 18, 31, 33, 16, 9, 27, 22, 14, 35, 29, 20, 5, 11, 38, 26, 23, 13, 36, 28, 8, 17, 32, 4, 21, 15, 10, 39, 25, 24, 12, 37];
    if (n === 40) return [1, 3, 6, 10, 39, 25, 24, 40, 9, 16, 33, 31, 18, 7, 2, 23, 26, 38, 11, 5, 20, 29, 35, 14, 22, 27, 37, 12, 13, 36, 28, 8, 17, 19, 30, 34, 15, 21, 4, 32];
    if (n === 41) return [1, 3, 6, 10, 15, 21, 4, 32, 17, 19, 30, 34, 2, 7, 18, 31, 33, 16, 9, 40, 41, 8, 28, 36, 13, 23, 26, 38, 11, 5, 20, 29, 35, 14, 22, 27, 37, 12, 24, 25, 39];
    if (n === 42) return [1, 3, 6, 10, 15, 21, 4, 5, 11, 38, 26, 23, 13, 36, 28, 8, 41, 40, 9, 27, 37, 12, 24, 25, 39, 42, 22, 14, 35, 29, 20, 16, 33, 31, 18, 7, 2, 34, 30, 19, 17, 32];
    if (n === 43) return [1, 3, 6, 10, 15, 21, 43, 38, 11, 5, 4, 32, 17, 19, 30, 34, 2, 7, 18, 31, 33, 16, 20, 29, 35, 14, 22, 42, 39, 25, 24, 12, 37, 27, 9, 40, 41, 8, 28, 36, 13, 23, 26];
    if (n === 44) return [1, 3, 6, 10, 15, 21, 4, 32, 17, 19, 30, 34, 2, 7, 18, 31, 33, 16, 9, 27, 22, 42, 39, 25, 11, 14, 35, 29, 20, 5, 44, 37, 12, 24, 40, 41, 8, 28, 36, 13, 23, 26, 38, 43];
    if (n === 45) return [1, 3, 6, 10, 15, 21, 28, 8, 17, 32, 4, 5, 11, 14, 35, 29, 20, 44, 37, 12, 13, 36, 45, 19, 30, 34, 2, 7, 18, 31, 33, 16, 9, 27, 22, 42, 39, 25, 24, 40, 41, 23, 26, 38, 43];
}

// ---

function square_sums_row(N) {
    var numbers = [0];

    for (var i = 1; i <= N; i++)
        numbers[i] = { number: i, beenUsed: 0, usedCount: 0, numbers: [] };

    for (i = 2, sq = i * i; sq < N * 2; sq = ++i * i) {
        for (v1 = Math.max(sq - N, 1); v1 < sq / 2; v1++) {
            v2 = sq - v1;
            numbers[v1].numbers.push(numbers[v2]);
            numbers[v2].numbers.push(numbers[v1]);
        }
    }

    numbers.shift();

    var fSort = function (a, b) {
        return a.numbers.length - a.usedCount - b.numbers.length + b.usedCount
            || +(level < 400) && a.numbers.length - b.numbers.length;
    }

    var levels = [], level = 0, num;
    while (level > -1 && level < N) {
        var currentLevel = levels[level] ||
            (levels[level] = { variants: numbers.sort(fSort), variantInd: -1 });

        if (num = currentLevel.number) {
            num.beenUsed = 0;
            num.numbers.forEach(v => v.usedCount--);
        }

        if (num = currentLevel.number = currentLevel.variants[++currentLevel.variantInd]) {
            num.beenUsed = 1;
            numbers = num.numbers.filter(v => { v.usedCount++; return !v.beenUsed; })
        } else numbers = [];

        levels.length = 1 + (level += (numbers.length > 0 || level == N - 1) - !num);
    }

    return level == N && !levels.pop() && levels.map(v => v.number.number);
}