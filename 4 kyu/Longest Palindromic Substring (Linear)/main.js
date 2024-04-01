function palindrome(s, i, j) {
    while (i >= 0 && j < s.length && s[i] == s[j]) {
        i--;
        j++;
    }
    return s.substr(i + 1, j - 1 - i);
}

function longest_palindrome(input) {
    let maxp = "";
    for (let i = 0; i < input.length; i++) {
        let s1 = palindrome(input, i, i);
        let s2 = palindrome(input, i, i + 1);
        maxp = maxp.length < s1.length ? s1 : maxp;
        maxp = maxp.length < s2.length ? s2 : maxp;
    }
    return maxp;
}