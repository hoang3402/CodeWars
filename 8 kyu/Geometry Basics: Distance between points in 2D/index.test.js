const Test = require('assert').strict;
import distanceBetweenPoints from './index.js';

class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}

describe("Solution", function () {
    it("Fixed Tests (random order)", function () {
        Test.assertApproxEquals(distanceBetweenPoints(new Point(3, 3), new Point(3, 3)), 0);
        Test.assertApproxEquals(distanceBetweenPoints(new Point(1, 6), new Point(4, 2)), 5);
        Test.assertApproxEquals(distanceBetweenPoints(new Point(-10.2, 12.5), new Point(0.3, 14.7)).toFixed(6), 10.728001);
    });

    it("Random Tests", function () {
        for (let i = 0; i < 100; ++i) {
            a = new Point(Math.random() * 100 - 50, Math.random() * 100 - 50);
            b = new Point(Math.random() * 100 - 50, Math.random() * 100 - 50);
            expected = Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2)).toFixed(6);
            actual = distanceBetweenPoints(a, b).toFixed(6);
            Test.assertApproxEquals(actual, expected);
        }
    });
});