// #include <ctime>

// Describe(Fixed_tests)
// {
//     It(Digital_root)
//     {
//         Assert::That(digital_root(16) , Equals(7));
//         Assert::That(digital_root(195) , Equals(6));
//         Assert::That(digital_root(992) , Equals(2));
//         Assert::That(digital_root(167346) , Equals(9));
//         Assert::That(digital_root(0) , Equals(0));
//         Assert::That(digital_root(10) , Equals(1));
//     }
// };

// Describe(Random_tests)
// {
//     It(randomized_test)
//     {
//         srand(time(NULL));
//         for(int i = 3; i < 103; i++) {
//             int C = std::rand();
//             Assert::That(digital_root(C) , Equals((C-1) % 9 + 1));
//         }
//     }
// };