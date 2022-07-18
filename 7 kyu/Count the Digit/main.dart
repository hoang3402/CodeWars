int nbDig(int n, int d) {
  int res = 0;
  for (int k = 0; k <= n; k++) {
    int temp = k * k;
    res += temp.toString().split('').where((e) => e == d.toString()).length;
  }
  return res;
}

int nbDig(int n, int d) {
  var count = 0;
  for (var i = 0; i <= n; i++) {
    count += d.toString().allMatches((i*i).toString()).length;
  }
  return count;
}

int nbDig(int n, int d) =>
    '$d'.allMatches([for (var i = 0; i <= n; i += 1) i * i].join()).length;