function isSolved(board) {
    for (var i = 0; i < 3; i++) {
        // hàng ngang
        if (board[i].filter(x => x === 1).length === 3) return 1;
        if (board[i].filter(x => x === 2).length === 3) return 2;

        // hàng dọc
        var x = 0;
        var o = 0;
        for (var j = 0; j < 3; j++) {
            if (board[j][i] === 1) x++;
            if (board[j][i] === 2) o++;
        }
        if (x === 3) return 1;
        if (o === 3) return 2;
    }

    // hàng chéo trái xuống phải
    var x = 0;
    var o = 0;
    for (var i = 0; i < 3; i++) {
        if (board[i][i] === 1) x++;
        if (board[i][i] === 2) o++;
    }
    if (x === 3) return 1;
    if (o === 3) return 2;

    // hàng chéo phải xuống trái
    x = 0;
    o = 0;
    for (var j = 0, k = 2; j < 3; j++, k--) {
        if (board[j][k] === 1) x++;
        if (board[j][k] === 2) o++;
    }
    if (x === 3) return 1;
    if (o === 3) return 2;

    for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
            if (board[i][j] === 0) {
                return -1;
            }
        }
    }

    return 0;
}

////////////

// Regex 
function isSolved(board) {
    board = board.join('-').replace(/,/g, '');
    if (/222|2...2...2|2....2....2|2..2..2/.test(board)) return 2;
    if (/111|1...1...1|1....1....1|1..1..1/.test(board)) return 1;
    if (/0/.test(board)) return -1;
    return 0;
}

