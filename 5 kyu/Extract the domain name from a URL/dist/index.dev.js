"use strict";

function domainName(url) {
  return url.replace(/^(?:https?:\/\/)?(?:www\.)?/i, '').replace(/\/.*$/, '').split('.')[0];
}

console.log(domainName("http://google.com"));
console.log(domainName("http://google.co.jp"));
console.log(domainName("www.xakep.ru"));
console.log(domainName("https://www.youtube.com"));