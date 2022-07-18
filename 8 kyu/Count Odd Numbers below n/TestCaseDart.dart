// See https://pub.dartlang.org/packages/test
import "package:test/test.dart";
import "package:solution/solution.dart";
import 'dart:math';

int sol(n) {
  return (n / 2).floor();
}

void main() {
  group("basic tests", () {
    test('testing for 15', () {
      expect(oddCount(15), equals(7));
    });
    test('testing for 15023', () {
      expect(oddCount(15023), equals(7511));
    });
  });
  group("random tests", () {
    for (int i = 0; i < 100; i++) {
      int n = Random().nextInt(10000000);
      test('testing for $n', () {
        expect(oddCount(n), equals(sol(n)));
      });
    }
  });
}