function getMiddle(s) {
    if (s.length % 2 === 0) {
        return s.substring(s.length / 2 - 1, s.length / 2 + 1);
    } else {
        return s.charAt(s.length / 2);
    }
}

function getMiddle(s) {
    return s.substr(Math.ceil(s.length / 2 - 1), s.length % 2 === 0 ? 2 : 1);
}

function getMiddle(s) {
    return s.slice((s.length - 1) / 2, s.length / 2 + 1);
}