export default function add(x: number) {
    const innerAdd = (y: number) => {
        return add(x + y);
    };
    innerAdd.valueOf = () => x;
    return innerAdd;
}

//

// export default function add(x: number): any {
//     const fn = (y: number) => add(x + y);
//     fn.valueOf = () => x;
//     return fn;
// }