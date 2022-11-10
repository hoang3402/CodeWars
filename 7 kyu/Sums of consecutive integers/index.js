/**
     * Given the number of consecutive integers and the total of the integers,
     * return the consecutive integer at the requested position.
     *
     * @param {int} x number of consecutive integers
     * @param {int} y sum of consecutive integers
     * @param {int} n position of requested integer
     * @return {int} consecutive integer at requested position
*/
function position(x, y, n) {
    var arr = []

    for (var i = Math.ceil(y / x) - x; i < Math.ceil(y / x) + x; i++) {
        arr.push(i);
    }

    for (var i = 0; i < arr.length - x + 1; i++) {
        var temp = 0;
        var res = [];
        for (var j = 0; j < x; j++) {
            res.push(arr[j + i]);
            temp += arr[j + i];
            if (temp == y && res.length == x) {
                return res[n];
            }
        }
    }
}

// this is the logic: y/x = Average, 
// (x-1)/2 = HalfRange, 
// y/x - (x-1)/2 = first number, 
// finally return first number + n.
function position(x, y, n) {
    return y / x - (x - 1) / 2 + n;
}
