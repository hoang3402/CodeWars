const chai = require("chai");
const assert = chai.assert;

function dotest(length, minimum, maximum, expected) {
    it(`Testing length = ${length}, minimum = ${minimum}, maximum = ${maximum}`, function () {
        assert.equal(ascendDescend(length, minimum, maximum), expected);
    });
}

function doRandTests(numTests, minLen, maxLen, minVal, maxVal) {
    for (let i = 0; i < numTests; i++) {
        const length = minLen + (Math.floor(Math.random() * (maxLen - minLen + 1))),
            a = minVal + Math.floor(Math.random() * (maxVal - maxVal / 10 + 1)),
            b = a - Math.floor(maxVal / 10) + Math.floor(Math.random() * (maxVal - (a - Math.floor(maxVal / 10)) + 1));
        dotest(length, a, b, referenceSolution(length, a, b));
    }
}

function referenceSolution(length, minimum, maximum) {
    if (maximum < minimum || !length) return "";
    if (maximum == minimum) {
        const s = maximum.toString(), l = s.length;
        return s.repeat(Math.ceil(length / l)).slice(0, length);
    }
    let res = "";
    const checkLen = _ => res.length < length;
    while (checkLen()) {
        for (let n = minimum; n < maximum && checkLen(); n++) {
            res += n.toString();
        }
        for (let n = maximum; n > minimum && checkLen(); n--) {
            res += n.toString();
        }
    }
    return res.slice(0, length);
}

describe("Fixed Tests", function () {
    dotest(5, 1, 3, "12321");
    dotest(14, 0, 2, "01210121012101");
    dotest(11, 5, 9, "56789876567");
    dotest(15, 9, 15, "910111213141514");
    dotest(6, 10, 14, "101112");
    dotest(10, 1, 1, "1111111111");
    dotest(1, -5, -4, "-");
    dotest(1, -1, 0, "-");
    dotest(25, -9, -3, "-9-8-7-6-5-4-3-4-5-6-7-8-");
    dotest(0, 1, 2, "");
    dotest(14, -4, -5, "");
    dotest(5, 10, 12, "10111");
    dotest(6, 10, 12, "101112");
    dotest(7, 10, 12, "1011121");
    dotest(8, 10, 12, "10111211");
    dotest(9, 10, 12, "101112111");
    dotest(10, 10, 12, "1011121110");
    dotest(11, 10, 12, "10111211101");
});

describe("Small random Tests", function () {
    for (let mi = 0; mi < 6; mi++) {
        for (let ma = 5; ma < 11; ma++) {
            const l = 1 + Math.floor(Math.random() * 25);
            dotest(l, mi, ma, referenceSolution(l, mi, ma));
        }
    }
});

describe("Medium random Tests", function () {
    doRandTests(50, 0, 200, -100, 100)
});

describe("Large random Tests", function () {
    doRandTests(20, 250, 10000, -100, 10000)
});
