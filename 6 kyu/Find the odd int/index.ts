export const findOdd = (xs: number[]): number => {
    const map = new Map();
    let result = xs[0];

    xs.forEach((x) => {
        map.set(x, (map.get(x) || 0) + 1);
    })
    map.forEach((value, key) => {
        if (value & 1) {
            result = key
            return;
        }
    })

    return result;
};


// ---

// export const findOdd = (xs: number[]): number => {
//     return xs.reduce((a, b) => a ^ b);
// };