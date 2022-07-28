"use strict";

function solution(str) {
  if (str.length === 0) return [];
  return str.match(/.{1,2}/g).map(function (x) {
    return x.length === 1 ? x + '_' : x;
  });
}

console.log(solution("abcdefg"));
solution("abcdef");