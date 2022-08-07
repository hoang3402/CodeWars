#include <algorithm>
#include <vector>

// Index của bucket sẽ tuỳ vào [n]
// nếu [n] > 0 ⇒ a[i] / n
// còn [n] < 0 và n lẻ ⇒ a[i] * n
std::vector<int> BucketSort(const std::vector<int>& a)
{
    int n = a.size();
    std::vector<float> temp[n];
    std::vector<int> result;

    for (int i = 0; i < n; i++) {
        int bucket_index = a[i] / n;
        temp[bucket_index].push_back(a[i]);
    }

    for (int i = 0; i < n; i++)
        std::sort(temp[i].begin(), temp[i].end());

    for (auto& i : temp) {
        for (auto j : i) {
            result.push_back(j);
        }
    }
    return result;
}