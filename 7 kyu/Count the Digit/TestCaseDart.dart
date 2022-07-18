import "package:test/test.dart";
import "package:solution/solution.dart";
import "dart:math";

void main() {
  void dotest(int n, int d, int exp) {
    test("nbDig($n, $d)", () => expect(nbDig(n, d), equals(exp)));
  }
  
  group("fixed tests", () {
    dotest(5750, 0, 4700);
    dotest(11011, 2, 9481);
    dotest(12224, 8, 7733);
    dotest(11549, 1, 11905);
    dotest(14550, 7, 8014);
    dotest(8304, 7, 3927);
    dotest(10576, 9, 7860);
    dotest(12526, 1, 13558);
    dotest(7856, 4, 7132);
    dotest(14956, 1, 17267);    
  });
  
  group("Random tests", () {
    Random r = Random();
    int rand(int a, int b) => r.nextInt(b - a + 1) + a;
    int sol(int n, int d) => List<int>.generate(n + 1, (i) => i).fold(0, (a, b) => a + (b * b).toString().split('').where((x) => x == d.toString()).length);
    for (int i = 0; i < 100; i++) {
      int n = rand(8000, 15000);
      int d = rand(0, 9);
      dotest(n, d, sol(n, d));
    }
  });
}
