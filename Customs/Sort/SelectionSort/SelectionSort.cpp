#include <algorithm>
#include <iostream>
#include <vector>

void SelectionSort(std::vector<int> a)
{
    int length = a.size(), index_min;
    for (int i = 0; i < length - 1; i++) {
        index_min = i;
        for (int j = i + 1; j < length; j++) {
            if (a[index_min] > a[j]) {
                index_min = j;
            }
        }
        std::swap(a[index_min], a[i]);
    }
    for (auto i : a) {
        std::cout << i << " ";
    }
}