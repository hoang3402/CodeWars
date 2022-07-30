"use strict";

function countBy(x, n) {
  var z = [];

  for (var i = 1; i <= n; i++) {
    z.push(x * i);
  }

  return z;
}