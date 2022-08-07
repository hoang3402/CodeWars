#include <vector>

std::vector<int> merge(std::vector<int> left, std::vector<int> right)
{
    // index của 2 mảng tạm
    unsigned long iOfLeft = 0, iOfRight = 0;
    std::vector<int> results;
    while (iOfLeft < left.size() && iOfRight < right.size())
        if (left[iOfLeft] < right[iOfRight])
            results.push_back(left[iOfLeft++]);
        else
            results.push_back(right[iOfRight++]);
    // nếu còn phần tử thì thêm vô hết mảng results
    while (iOfLeft < left.size())
        results.push_back(left[iOfLeft++]);
    while (iOfRight < right.size())
        results.push_back(right[iOfRight++]);
    return results;
}

std::vector<int> mergeSort(std::vector<int>& arr)
{
    if (arr.size() <= 1)
        return arr;
    int len = arr.size() / 2;
    std::vector<int> left(arr.begin(), arr.begin() + len);
    std::vector<int> right(arr.begin() + len, arr.end());
    return merge(mergeSort(left), mergeSort(right));
}