const assert = require('chai').assert

describe("mxdiflg", function () {
    it("Basic tests", function () {
        let s1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"];
        let s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"];
        assert.strictEqual(mxdiflg(s1, s2), 13);
        s1 = ["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"];
        s2 = ["bbbaaayddqbbrrrv"];
        assert.strictEqual(mxdiflg(s1, s2), 10);
        s1 = ["ccct", "tkkeeeyy", "ggiikffsszzoo", "nnngssddu", "rrllccqqqqwuuurdd", "kkbbddaakkk"];
        s2 = ["tttxxxxxxgiiyyy", "ooorcvvj", "yzzzhhhfffaaavvvpp", "jjvvvqqllgaaannn", "tttooo", "qmmzzbhhbb"];
        assert.strictEqual(mxdiflg(s1, s2), 14);
        s1 = [];
        s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"];
        assert.strictEqual(mxdiflg(s1, s2), -1);
        s2 = [];
        s1 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"];
        assert.strictEqual(mxdiflg(s1, s2), -1);
        s1 = [];
        s2 = [];
        assert.strictEqual(mxdiflg(s1, s2), -1);
    })
})

describe("100 Random tests", function () {

    //................
    function randint(a, b) {
        return Math.floor(Math.random() * (b - a + 1) + a);
    }
    function mxdiflgSol(a1, a2) {
        let mx = -1;
        for (let x in a1)
            for (let y in a2) {
                let diff = Math.abs(a1[x].length - a2[y].length);
                if (diff > mx)
                    mx = diff;
            }
        return mx;
    }
    function doEx(k) {
        let a1 = [], u = 0;
        while (u < k) {
            let res = "", i = 0;
            while (i < randint(1, 15)) {
                let sm = String.fromCharCode(randint(97, 122));
                for (let j = 0; j < randint(1, 5); j++)
                    res += sm;
                i++;
            }
            a1.push(res);
            u++;
        }
        return a1;
    }
    //................
    for (let i = 0; i < 100; i++) {
        let s1 = doEx(randint(0, 10));
        let s2 = doEx(randint(0, 8));
        it("Random Testing mxdiflg: ", function () {
            assert.strictEqual(mxdiflg(s1, s2), mxdiflgSol(s1, s2), "It should work for random tests too");
        }
        )
    }
})