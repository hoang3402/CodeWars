"use strict";

function smallEnough(a, limit) {
  return a.every(function (x) {
    return x <= limit;
  });
}