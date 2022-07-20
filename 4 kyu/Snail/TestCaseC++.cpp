// #include <algorithm>
// #include <random>
// #include <vector>

// using std::vector;

// Describe(Fixed_Tests) {
//   It(Tests) {
//     vector<vector<int>> v;
//     vector<int> expected;

//     v = {{}};
//     expected = {};
//     Assert::That(snail(v), Equals(expected));

//     v = {{1}};
//     expected = {1};
//     Assert::That(snail(v), Equals(expected));

//     v = {{1,2}, {4,3}};
//     expected = {1,2,3,4};
//     Assert::That(snail(v), Equals(expected));

//     v = {{1,2,3}, {8,9,4}, {7,6,5}};
//     expected = {1,2,3,4,5,6,7,8,9};
//     Assert::That(snail(v), Equals(expected));

//     v = {{1,2,3,4}, {12,13,14,5}, {11,16,15,6}, {10,9,8,7}};
//     expected = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
//     Assert::That(snail(v), Equals(expected));
//   }
// };

// Describe(Random_Tests) {
//   vector<int> solution(vector<vector<int>> a) {
//     vector<int> r;
//     if (a[0].empty()) return r;
//     int x = 0, left = a.size() * a.size();
//     while (true) {
//       for (unsigned long i = x; i < a.size()-x; i++) {
//         r.push_back(a[x][i]);
//         left--;
//         if (!left) return r;
//       }
//       for (unsigned long i = x+1; i < a.size()-(x+1); i++) {
//         r.push_back(a[i][a[i].size()-(x+1)]);
//         left--;
//       }
//       for (unsigned long i = x; i < a.size()-x; i++) {
//         r.push_back(a[a.size()-(x+1)][a[a.size()-(x+1)].size()-(i+1)]);
//         left--;
//         if (!left) return r;
//       }
//       for (unsigned long i = x+1; i < a.size()-(x+1); i++) {
//         r.push_back(a[a.size()-(i+1)][x]);
//         left--;
//       }
//       x++;
//     }
//   }

//   auto randint(int min, int max) {
//     static std::random_device rd;
//     static std::mt19937 rng(rd());
//     std::uniform_int_distribution<int> uni(min, max);
//     return uni(rng);
//   }

//   It(Tests) {
//     for (int i = 0; i < 100; i++) {
//       vector<vector<int>> values;
//       int n = randint(1, 20);
//       for (int j = 0; j < n; j++) {
//         values.push_back(vector<int>());
//         for (int k = 0; k < n; k++)
//           values[j].push_back(randint(1, 1000));
//       }
//       vector<int> result = solution(values);
//       Assert::That(snail(values), Equals(result));
//     }
//   }
// };