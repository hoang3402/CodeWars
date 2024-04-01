export const pigIt = (a: string): string => {
    return a.split(' ').map((word) => {
        if (word.match(/[a-z]/i)) {
            let first = word.slice(0, 1);
            let rest = word.slice(1);
            word = rest + first + 'ay';
        }
        return word
    }).join(' ');
}

//---

// export const pigIt = (a : string) => a.replace(/(\w)(\w+)*/g, "$2$1ay")


//---

// export const pigIt = (a: string): string => {
//     return a.replace(/[a-z]+/ig, x => x.slice(1) + x[0] + "ay")
// }

//---

