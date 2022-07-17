// tự giải
function mxdiflg(a1, a2) {
    var result = -1;
    for (var i = 0; i < a1.length; i++) {
        for (var j = 0; j < a2.length; j++) {
            var diff = Math.abs(a1[i].length - a2[j].length);
            if (diff > result) {
                result = diff;
            }
        }
    }
    return result;
}

function mxdiflg(a1, a2) {
    if (a1.length === 0 || a2.length === 0) return -1
    let l1 = a1.map(str => str.length)
    let l2 = a2.map(str => str.length)
    return Math.max(Math.max(...l1) - Math.min(...l2), Math.max(...l2) - Math.min(...l1))
}

function mxdiflg(a1, a2) {
    var max = -1;
    for (var A1 of a1)
        for (var A2 of a2)
            max = Math.max(max, Math.abs(A1.length - A2.length));
    return max;
}

function mxdiflg(a1, a2) {
    const maxx = (x) => x.map(el => el.length)
    return a1.length === 0 || a2.length === 0 ? -1 : Math.max(Math.max(...maxx(a1)) - Math.min(...maxx(a2)), Math.max(...maxx(a2)) - Math.min(...maxx(a1)))
}

function mxdiflg(a1, a2) {
    if (!a1.length || !a2.length) return -1;
    a1.sort((a, b) => a.length - b.length);
    a2.sort((a, b) => a.length - b.length)
    return Math.max(Math.abs(a1[0].length - a2[a2.length - 1].length), Math.abs(a2[0].length - a1[a1.length - 1].length));
}