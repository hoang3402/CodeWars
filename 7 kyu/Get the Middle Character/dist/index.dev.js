"use strict";

function getMiddle(s) {
  if (s.length % 2 === 0) {
    return s.substring(s.length / 2 - 1, s.length / 2 + 1);
  } else {
    return s.charAt(s.length / 2);
  }
}