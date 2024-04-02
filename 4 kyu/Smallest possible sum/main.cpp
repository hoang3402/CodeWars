#include <algorithm>
#include <vector>

using namespace std;

unsigned long long solution(const vector<unsigned long long>& arr)
{
    unsigned long long _gcd = arr[0];

    for (int i = 1; i < arr.size(); i++) {
        _gcd = __gcd(_gcd, arr[i]);
    }

    return _gcd * arr.size();
}

// ---

#include <numeric>
#include <vector>

unsigned long long solution(const std::vector<unsigned long long>& xs)
{
    return xs.size() * std::reduce(xs.cbegin(), xs.cend(), xs[0], std::gcd<unsigned long long, unsigned long long>);
}