#include "7 kyu/Speed Control/main.cpp"
#include <algorithm> // std::equal
#include <assert.h> /* assert */
#include <chrono>
#include <cmath>
#include <iostream>
#include <random>
#include <vector>

void testequal(int ans, int sol)
{
    Assert::That(ans, Equals(sol));
}
void dotest(int s, std::vector<double>& a1, int expected)
{
    testequal(GpsSpeed::gps(s, a1), expected);
}

unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
std::default_random_engine gen(seed);

std::vector<double> doVect(int n)
{
    std::uniform_int_distribution<> dis1(1, 35);
    std::vector<double> x(n);
    x[0] = 0.0;
    int prev = 0;
    for (int i = 1; i < n; i++) {
        int v = dis1(gen);
        while (v < prev)
            v++;
        prev = v;
        x[i] = i * v / 100.0;
    }
    return x;
}

int gps3001(int s, std::vector<double>& x)
{
    if (x.size() <= 1)
        return 0;
    double mx = 1, v = 0;
    for (unsigned int k = 0; k < x.size() - 1; k++) {
        v = (3600 * (x[k + 1] - x[k]) / s);
        if (v > mx)
            mx = v;
    }
    return static_cast<int>(std::floor(mx));
}

void randomtesting()
{
    std::cout << " ****************** Random Tests **** gps\n";
    for (int i = 0; i < 200; i++) {
        std::uniform_int_distribution<int> uni1(10, 50);
        int rn1 = uni1(gen);
        std::vector<double> arr1 = doVect(rn1);
        std::uniform_int_distribution<int> uni2(12, 35);
        int rn2 = uni2(gen);
        int sol = gps3001(rn2, arr1);
        dotest(rn2, arr1, sol);
    }
}

Describe(gps_Tests) {
    It(Fixed__Tests) {
        std::vector<double> x = { 0.0, 0.23, 0.46, 0.69, 0.92, 1.15, 1.38, 1.61 };
dotest(20, x, 41);
x = { 0.0, 0.11, 0.22, 0.33, 0.44, 0.65, 1.08, 1.26, 1.68, 1.89, 2.1, 2.31, 2.52, 3.25 };
dotest(12, x, 219);
x = { 0.0, 0.18, 0.36, 0.54, 0.72, 1.05, 1.26, 1.47, 1.92, 2.16, 2.4, 2.64, 2.88, 3.12, 3.36, 3.6, 3.84 };
dotest(20, x, 80);
x = { 0.0, 0.01, 0.36, 0.6, 0.84, 1.05, 1.26, 1.47, 1.68, 1.89, 2.1, 2.31, 2.52, 2.73, 2.94, 3.15 };
dotest(14, x, 90);
x = { 0.0, 0.02, 0.36, 0.54, 0.72, 0.9, 1.08, 1.26, 1.44, 1.62, 1.8 };
dotest(17, x, 72);
x = { 0.0, 0.24, 0.48, 0.72, 0.96, 1.2, 1.44, 1.68, 1.92, 2.16, 2.4 };
dotest(12, x, 72);
x = { 0.0, 0.02, 0.44, 0.66, 0.88, 1.1, 1.32, 1.54, 1.76 };
dotest(17, x, 88);
x = { 0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.32, 1.54, 1.76, 1.98, 2.2, 2.42, 2.76, 2.99, 3.22, 3.45 };
dotest(16, x, 76);
x = { 0.0, 0.01, 0.36, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25, 2.5, 2.75, 3.0, 3.25, 3.5, 3.75, 4.0, 4.25, 4.5, 4.75 };
dotest(17, x, 82);
x = { 0.0, 0.2, 0.4, 0.69, 0.92, 1.15, 1.38, 1.61, 1.92, 2.16, 2.4, 2.64, 2.88, 3.12, 3.36 };
dotest(19, x, 58);
x = {};
dotest(19, x, 0);
x = { 0.0 };
dotest(19, x, 0);
}
It(Random_gps)
{
    randomtesting();
}
}
;