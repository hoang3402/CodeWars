// exp_sum(1) // 1
// exp_sum(2) // 2  -> 1+1 , 2
// exp_sum(3) // 3 -> 1+1+1, 1+2, 3
// exp_sum(4) // 5 -> 1+1+1+1, 1+1+2, 1+3, 2+2, 4
// exp_sum(5) // 7 -> 1+1+1+1+1, 1+1+1+2, 1+1+3, 1+2+2, 1+4, 5, 2+3

// exp_sum(10) // 42
function sum(num) {
    let ways = new Array(num + 1).fill(0);
    ways[0] = 1;

    for (let i = 1; i <= num; i++) {
        for (let j = i; j <= num; j++) {
            ways[j] += ways[j - i];
        }
    }

    return ways[num];
}