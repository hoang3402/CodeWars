num makeNegative(n) {
  return n > 0 ? -n : n;
}

num makeNegative(n) => -n.abs();

num makeNegative(n)=> !n.isNegative ? -n : n;

num makeNegative(n) => n > 0 ? -n : n;
