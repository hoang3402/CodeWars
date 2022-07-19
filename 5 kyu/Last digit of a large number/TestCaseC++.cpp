// #include <cmath>
// #include <random>
// #include <sstream>
// #include <string>

// Describe(Fixed_Tests) {
//   It(Tests) {
//     Assert::That(last_digit("4", "1"), Equals(4));
//     Assert::That(last_digit("4", "2"), Equals(6));
//     Assert::That(last_digit("9", "7"), Equals(9));
//     Assert::That(last_digit("9", "0"), Equals(1));
//     Assert::That(last_digit("10", "10000000000"), Equals(0));
//     Assert::That(last_digit("4200574979866020043461928", "0"), Equals(1));
//     Assert::That(last_digit("1606938044258990275541962092341162602522202993782792835301376", "2037035976334486086268445688409378161051468393665936250636140449354381299763336706183397376"), Equals(6));
//     Assert::That(last_digit("3715290469715693021198967285016729344580685479654510946723", "68819615221552997273737174557165657483427362207517952651"), Equals(7));
//   }
// };

// Describe(Random_Tests) {
//   int solution(const std::string &s1, const std::string &s2) {
//     if (s2 == "0") return 1;
//     int n1 = s1[s1.size()-1] - '0';
//     int x = s2.length() > 1 ? 2 : 1;
//     int n2 = stoi(s2.substr(s2.length()-x, x));
//     int d = n1 < 2 || n1 == 5 || n1 == 6 ? 1 : n1 == 4 || n1 == 9 ? 2 : 4;
//     return (int)pow(n1, (n2 %= d) ? n2 : n2 + d) % 10;
//   }

//   auto randint(int min, int max) {
//     static std::random_device rd;
//     static std::mt19937 rng(rd());
//     std::uniform_int_distribution<int> uni(min, max);
//     return uni(rng);
//   }

//   std::string gen_number(int n) {
//     std::stringstream ss;
//     if (n > 1) n--, ss << randint(1, 9);
//     while (n--) ss << randint(0, 9);
//     return ss.str();
//   }

//   It(Tests) {
//     for (int i = 1; i <= 30; i++)
//       for (int j = 0; j < i * 10; j++) {
//         std::string s1 = gen_number(randint(1, i)),
//                     s2 = gen_number(randint(1, i));
//         int result = solution(s1, s2);
//         Assert::That(last_digit(s1, s2), Equals(result));
//       }
//   }
// };