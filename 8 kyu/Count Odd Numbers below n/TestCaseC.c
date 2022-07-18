// #include <criterion/criterion.h>
#include <stdlib.h>
#include <time.h>

long odd_count(long);

// Test(Fixed_Tests, Tests) {
//     cr_assert_eq(odd_count(15), 7);
//     cr_assert_eq(odd_count(15023), 7511);
// }

static long solution_12748490506594845(long n) {
  return n / 2;
}

// Test(Random_Tests, Tests) {
//     srand(time(NULL));
//     for (int i = 0; i < 200; i++) {
//       long n = rand();
//       long user = odd_count(n);
//       long result = solution_12748490506594845(n);
//       cr_assert_eq(user, result, "Expected: %ld, Received: %ld\n", result, user);
//     }
// }