// #include <string>
// #include <chrono>
// #include <random>

// void testequal(int ans, int sol) {
//     Assert::That(ans, Equals(sol));
// }

// static void dotest(int n, int d, int expected)
// {
//     testequal(CountDig::nbDig(n, d), expected);
// }

// unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
// std::default_random_engine gen(seed);

// int nbDig9278(int n, int d)
// {
//     int k = 0, cnt = 0;
//     char c = std::to_string(d)[0];
//     while (k <= n)
//     {
//         int a = 0;
//         std::string s = std::to_string(k * k);
//         for (unsigned int i = 0; i < s.length(); i++)
//         {
//             if (s[i] == c) a++;
//         }
//         if (a > 0)
//             cnt += a;
//         k++;
//     }
//     return cnt;
// }

// void randomtesting()
// {
//     std::cout << " ****************** Random Tests **** nbDig\n";
//     for (int i = 0; i < 200; i++) {
//         std::uniform_int_distribution<int> uni1(2000, 15000);
//         std::uniform_int_distribution<int> uni2(0, 9);
//         int n = uni1(gen);
//         int d = uni2(gen);
//         dotest(n, d, nbDig9278(n, d));
//     }
// }

// Describe(nbDig_Tests)
// {
//     It(Fixed_Tests)
//     {
//         dotest(5750, 0, 4700);
//         dotest(11011, 2, 9481);
//         dotest(12224, 8, 7733);
//         dotest(11549, 1, 11905);
//         dotest(14550, 7, 8014);
//         dotest(8304, 7, 3927);
//         dotest(10576, 9, 7860);
//         dotest(12526, 1, 13558);
//         dotest(7856, 4, 7132);
//         dotest(14956, 1, 17267);
//     }
//     It(Random_tests)
//     {
//         randomtesting();
//     }
// };