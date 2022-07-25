#include "listPrime.h"
#include <bits/stdc++.h>

using namespace std;

// check prime number <= 1.000.000
bool isPrime(int n)
{
    for (int i = 0; i < 78498; i++)
        if (n == listPrime[i])
            return true;

    return false;
}

bool checkSolution(int input, int solution)
{
    return input == solution;
}

int solution(vector<long long> a)
{
    int n = a.size();
    int result = 0;
    vector<int> list;

    for (int i = 0; i < n; i++) {
        if (isPrime(i))
            list.push_back(i);
    }

    n = list.size();
    // {2, 3, 5}
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            int sum = 0;
            for (int k = list[i] - 1; k < list[j]; k++) {
                sum += a[k];
            }
            result = max(result, sum);
        }
    }

    return result;
}

int main()
{
    vector<long long> v = { 9, 5, -2, 6, -1, 1 };
    time_t start = clock();
    solution(v);
    time_t end = clock();
    cout << "Time: " << (double)(end - start) << endl;
    return 0;
}