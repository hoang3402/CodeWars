"use strict";

function sumMix(x) {
  return x.reduce(function (a, b) {
    return a - 0 + (b - 0);
  }, 0);
}