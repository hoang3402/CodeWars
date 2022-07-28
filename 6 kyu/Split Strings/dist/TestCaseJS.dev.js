"use strict";

function _templateObject() {
  var data = _taggedTemplateLiteral([""]);

  _templateObject = function _templateObject() {
    return data;
  };

  return data;
}

function _taggedTemplateLiteral(strings, raw) { if (!raw) { raw = strings.slice(0); } return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }

var chai = require("chai");

var assert = chai.assert;
chai.config.truncateThreshold = 0;
describe("Split Strings", function () {
  it("Basic tests", function () {
    assert.deepEqual(solution("abcdef"), ["ab", "cd", "ef"]);
    assert.deepEqual(solution("abcdefg"), ["ab", "cd", "ef", "g_"]);
    assert.deepEqual(solution(""), []);
  });
  it("Random tests", function () {
    function sol(str) {
      var pairs = str.match(/.{1,2}/gi);

      if (pairs && pairs[pairs.length - 1].length == 1) {
        pairs[pairs.length - 1] += '_';
      }

      return pairs || [];
    }

    for (var i = 0; i < 100; i++) {
      var s = Array(0 | Math.random() * 50 + 1).fill().map(function () {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"[Math.random() * 52 | 0];
      }).join(_templateObject());
      assert.deepEqual(solution(s), sol(s));
    }
  });
});