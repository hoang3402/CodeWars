function solution(str) {
    if (str.length === 0) return [];
    return str.match(/.{1,2}/g).map(x => x.length === 1 ? x + '_' : x);
}

function solution(s) {
    return (s + "_").match(/.{2}/g) || []
}

const solution = str => ((str + "_").match(/../g) || []);
