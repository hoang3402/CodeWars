var boardPrint = function (board) {
    return "[" + board.map(function (r) { return '[' + r.join(',') + ']' }).join(",") + "]";
};

Array.prototype.shuffle = function () { for (var a = this.slice(0), c, d, b = a.length; b; c = Math.floor(Math.random() * b), d = a[--b], a[b] = a[c], a[c] = d); return a };

var boards = [];
boards.push([[[1, 1, 1],
[0, 2, 2],
[0, 0, 0]], 1]);
boards.push([[[1, 2, 0],
[0, 1, 2],
[0, 0, 1]], 1]);
boards.push([[[2, 1, 1],
[0, 1, 1],
[2, 2, 2]], 2]);
boards.push([[[2, 2, 2],
[0, 1, 1],
[1, 0, 0]], 2]);
boards.push([[[2, 1, 2],
[2, 1, 1],
[1, 2, 1]], 0]);
boards.push([[[1, 2, 1],
[1, 1, 2],
[2, 1, 2]], 0]);
boards.push([[[2, 0, 2],
[2, 1, 1],
[1, 2, 1]], -1]);
boards.push([[[0, 0, 2],
[0, 0, 0],
[1, 0, 1]], -1]);
boards.push([[[1, 2, 1],
[1, 1, 2],
[2, 2, 0]], -1]);
boards.push([[[0, 2, 2],
[2, 1, 1],
[0, 0, 1]], -1]);
boards.push([[[0, 1, 1],
[2, 0, 2],
[2, 1, 0]], -1]);
boards = boards.shuffle();

var result, expected, err;

describe('Testing return of isSolved function', function () {
    for (var i = 0; i < boards.length; i++) {
        err = "For the following board: " + boardPrint(boards[i][0]);
        expected = boards[i][1];
        result = isSolved(boards[i][0]);
        Test.assertEquals(result, expected, err);
    }
});