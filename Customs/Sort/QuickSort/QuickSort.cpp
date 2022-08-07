#include <vector>

int Mid(std::vector<int>& arr, int left, int right)
{
    int pivot = arr[left];
    int leftTemp = left + 1;
    int rightTemp = right;

    while (true) {
        while (leftTemp < rightTemp && arr[rightTemp] >= pivot)
            rightTemp--;
        while (leftTemp < rightTemp && arr[leftTemp] < pivot)
            leftTemp++;

        if (leftTemp == rightTemp || leftTemp > rightTemp)
            break;

        std::swap(arr[leftTemp], arr[rightTemp]);
    }

    if (arr[leftTemp] >= pivot)
        return left;
    std::swap(arr[leftTemp], arr[left]);

    return leftTemp;
}

void QuickSort(std::vector<int>& arr, int low, int high)
{
    if (low < high) {
        int mid = Mid(arr, low, high);
        QuickSort(arr, low, mid - 1);
        QuickSort(arr, mid + 1, high);
    }
}