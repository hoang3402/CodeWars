#include <stddef.h>

int __gcd(int __n, int __m)
{
    while (__n != 0) {
        int __t = __m % __n;
        __m = __n;
        __n = __t;
    }
    return __m;
}

int smallest_possible_sum(size_t n, const int arr[n])
{
    int _gcd = arr[0];

    for (int i = 1; i < n; i++) {
        _gcd = __gcd(_gcd, arr[i]);
    }

    return _gcd * n;
}