export function oddCount(n: number) {
    return Math.floor(n / 2);
}


export const oddCount2 = (n: number) => Math.floor(n / 2);


const maxArray = 4294967295;
export function oddCount3(n: number) {
    if (n < 1) {
        return 0;
    }
    return Math.trunc(n / 2);
}

export function oddCount4(n: number) {
    if (n % 2 === 0) {
        return n / 2;
    } else {
        return (n - 1) / 2
    }
}