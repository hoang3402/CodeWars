#include <vector>
int maxSequence(const std::vector<int>& arr)
{
    if (arr.size() == 0)
        return 0;
    int max_so_far = 0;
    int max_ending_here = 0;

    for (auto i : arr) {
        max_ending_here += i;
        if (max_ending_here > max_so_far) {
            max_so_far = max_ending_here;
        }
        if (max_ending_here < 0) {
            max_ending_here = 0;
        }
    }
    return max_so_far;
}

#include <vector>
using namespace std;
int maxSequence_2(const vector<int>& arr) noexcept
{
    int max = 0, local = 0;
    for (auto x : arr) {
        local = std::max(0, x + local);
        max = std::max(max, local);
    }
    return max;
}

#include <vector>
using namespace std;
int maxSequence_3(const vector<int>& arr)
{
    int res = 0, sum = 0;
    for (int e : arr)
        res = max(res, sum = max(sum + e, e));
    return res;
}