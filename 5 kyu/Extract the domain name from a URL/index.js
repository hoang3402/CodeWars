function domainName(url) {
    return url.replace(/^(?:https?:\/\/)?(?:www\.)?/i, '').replace(/\/.*$/, '').split('.')[0];
}

function domainName(url) {
    url = url.replace("https://", '');
    url = url.replace("http://", '');
    url = url.replace("www.", '');
    return url.split('.')[0];
};

function domainName(url) {
    return url.match(/(?:http(?:s)?:\/\/)?(?:w{3}\.)?([^\.]+)/i)[1];
}

function domainName(url) {
    return url.replace('http://', '')
        .replace('https://', '')
        .replace('www.', '')
        .split('.')[0];
}

console.log(domainName("http://google.com"))
console.log(domainName("http://google.co.jp"))
console.log(domainName("www.xakep.ru"))
console.log(domainName("https://www.youtube.com"))