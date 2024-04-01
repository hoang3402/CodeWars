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

// ---

const TOP = 1300;
const SQ = new Set(Array.from({ length: (2 * TOP) ** .5 | 0 }, (_, i) => (i + 1) ** 2));

function square_sums_row(top) {

    const dfs = cnds => {
        if (out.length == top) return 1;
        if (!cnds.length || !cnds[0].size && out.length != top - 1) return false;

        for (let c of cnds) {
            let cuts = c.unLink();
            out.push(c.n);
            if (dfs(c.getCnds())) return 1;
            out.pop();
            c.link(cuts);
        }
        return false;
    };
    let cnds = Array.from({ length: top }, (_, i) => new Cnd(i + 1));
    for (let c of cnds) for (let sq of SQ) if (c.n < sq && sq - c.n <= top && 2 * c.n != sq) c.add(cnds[sq - c.n - 1]);
    cnds.sort(Cnd.cmp);
    if (cnds.length && cnds[0].size == 1) cnds = cnds.filter(c => c.size == 1);

    let out = [];
    return dfs(cnds) && out;
}

class Cnd extends Set {
    static cmp(a, b) { return a.size - b.size || b.n - a.n; }

    constructor(n) { super(); this.n = n; }
    getCnds() { return [...this].sort(Cnd.cmp) }
    unLink() {
        let cuts = [...this];
        for (let c of cuts) c.delete(this);
        return cuts;
    }
    link(cuts) { cuts.forEach(c => c.add(this)); }
}

// ---

function buildGraph(n) {
    const squares = [];
    for (let i = 2; i * i < 2 * n; i++) squares.push(i * i);
    const graph = [...Array(n + 1)].map(e => new Set());
    for (let i = 0; i <= n; i++) {
        for (let j of squares) {
            if (i < j) {
                let diff = j - i;
                if (diff == i) continue;
                if (diff <= n) graph[i].add(diff);
                else break;
            }
        }
    }
    return graph;
}

function square_sums_row(n) {
    const graph = buildGraph(n);
    const candidates = [...Array(n)].map((_, val) => val + 1);

    const findNext = (currentCandidates, path) => {
        if (path.length == n) return path;
        currentCandidates.sort((a, b) => graph[a].size - graph[b].size);
        for (let candidate of currentCandidates) {
            path.push(candidate);
            graph[candidate].forEach(e => graph[e].delete(candidate));
            const newCandidates = [...graph[candidate]];
            const result = findNext(newCandidates, path);
            if (result) return result;
            path.pop();
            graph[candidate].forEach(e => graph[e].add(candidate));
        }
        return false;
    }
    return findNext(candidates, []);
}