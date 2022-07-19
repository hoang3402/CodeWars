#include <bits/stdc++.h>

using namespace std;

vector<int> move_zeroes(const vector<int>& input)
{
    vector<int> result;
    int counterOfZero = 0;
    for (int i : input) {
        if (i == 0) {
            counterOfZero++;
        } else {
            result.push_back(i);
        }
    }
    for (int i = 0; i < counterOfZero; i++) {
        result.push_back(0);
    }
    return result;
}

auto move_zeroes_2(vector<int> v)
{
    stable_partition(begin(v), end(v), negate());
    return v;
}
/*
std::negate() which in some compilers is implemented as std::negate(), or if you want to apply it to a specific value i.e. std::negate{}(2), return the negative of a value. For example for 2 it returns -2, for -4 it returns 4, but for 0 naturaly it returns 0.

Thus if you cast its result to a bool it will return 1 (true) for every value except 0 for which it returns 0 (false).

Now the stable_partion( begin(v) , end(v) , "some boolean expression " ) as it says in cplusplus.com:

"Rearranges the elements in the range [first,last), in such a way that all the elements for which pred returns true precede all those for which it returns false, and, unlike function partition, the relative order of elements within each group is preserved."

Given the preceding description it removes from the vector all elements that give false (or 0) in respect with the given boolean expression.

The size of the vector remains the same. The function fills with 0 the elements at the back of the vector.
*/

#include <vector>

std::vector<int> move_zeroes_3(const std::vector<int>& input)
{
    std::vector<int> v(input.size(), 0);
    int a = 0;
    for (auto c : input) {
        if (c != 0) {
            v[a] = c;
            ++a;
        }
    }
    return v;
}

auto move_zeroes_4(std::vector<int> v)
{
    std::stable_partition(begin(v), end(v), [](auto x) { return x; });
    return v;
}

#include <algorithm>
#include <vector>

std::vector<int> move_zeroes_5(std::vector<int> input)
{
    std::fill(std::remove(input.begin(), input.end(), 0), input.end(), 0);
    return input;
}

#include <vector>

std::vector<int> move_zeroes_6(const std::vector<int>& input)
{
    std::vector<int> moved;

    for (auto i : input) {
        if (i > 0 || i < 0) {
            moved.push_back(i);
        }
    }

    for (auto j : input) {
        if (j == 0) {
            moved.push_back(j);
        }
    }

    return moved;
}