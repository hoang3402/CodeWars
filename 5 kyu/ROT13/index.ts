function rot13Char(char: string): string {
    const code = char.charCodeAt(0);
    if ((code >= 65 && code <= 77) || (code >= 97 && code <= 109)) {
        return String.fromCharCode(code + 13);
    } else if ((code >= 78 && code <= 90) || (code >= 110 && code <= 122)) {
        return String.fromCharCode(code - 13);
    }
    return char;
}

export function rot13(str: string): string {
    let result = '';
    str.split('').forEach((char) => {
        result += rot13Char(char);
    })
    return result;
}

// ---

// export function rot13(str: string): string {
//     return str.replace(/[a-z]/gi, l => String.fromCharCode(l.charCodeAt(0) + (l.toLowerCase() <= 'm' ? 13 : -13)));
// }

