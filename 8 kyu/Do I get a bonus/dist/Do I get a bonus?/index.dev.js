"use strict";

function bonusTime(salary, bonus) {
  return bonus ? "\xA3".concat(salary * 10) : "\xA3".concat(salary);
}