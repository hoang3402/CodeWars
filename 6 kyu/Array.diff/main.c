#include <stdlib.h>

//  return a dynamically allocated array
//  assign the length of this array to *z
//  memory will be freed by the test suite

int* array_diff(const int* arr1, size_t n1, const int* arr2, size_t n2, size_t* z)
{
    int* result = (int*)malloc(sizeof(int) * n1);
    *z = 0;
    for (int i = 0; i < n1; i++) {
        int found = 0;
        for (int j = 0; j < n2; j++) {
            if (arr1[i] == arr2[j]) {
                found = 1;
                break;
            }
        }
        if (!found) {
            result[*z] = arr1[i];
            *z = *z + 1;
        }
    }
    return result;
}