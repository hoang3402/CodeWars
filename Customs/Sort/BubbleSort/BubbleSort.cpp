#include <algorithm>
#include <iostream>
#include <vector>

void BubbleSort(std::vector<int> a)
{
    int n = a.size();

    for (int i = 0; i < n - 1; i++)
        for (int j = 0; j < n - i - 1; j++)
            if (a[j] > a[j + 1])
                std::swap(a[j], a[j + 1]);

    for (auto i : a)
        std::cout << i << " ";
}