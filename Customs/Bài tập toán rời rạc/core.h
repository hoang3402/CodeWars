#include <bits/stdc++.h>
#pragma once

using namespace std;

void LietKeHoanViTapCon(vector<int> a, int n)
{
    // Sinh tập con hoán vị
    string test;
    int n2 = pow(2, n);
    for (int i = 0; i < n2; i++) {
        // Sinh tập hoán vị dựa trên nhị phân
        test = bitset<32>(i).to_string();
        reverse(test.begin(), test.end());

        // Tạo tập con
        for (int j = 0; j < n; j++) {
            if (test[j] == '1') {
                cout << a[j] << " ";
            }
        }
        cout << endl;
    }
}

void LietKeHoanViTapCon(vector<string> a, int n)
{
    // Sinh tập con hoán vị
    string test;
    int n2 = pow(2, n);
    for (int i = 0; i < n2; i++) {
        // Sinh tập hoán vị dựa trên nhị phân
        test = bitset<32>(i).to_string();
        reverse(test.begin(), test.end());

        // Tạo tập con
        for (int j = 0; j < n; j++) {
            if (test[j] == '1') {
                cout << a[j] << " ";
            }
        }
        cout << endl;
    }
}

void LietKeHoanViTapCon2(vector<int> a, int n)
{
    for (int i = 0; i < (n << 1); i++) {
        for (int j = 0; j < n; j++) {
            if (i & (1 << j)) {
                cout << a[j] << " ";
            }
        }
    }
}

void LietKeHoanViTapCon2(vector<string> a, int n)
{
    for (int i = 0; i < (1 << n); i++) {
        for (int j = 0; j < n; j++) {
            if (i & (1 << j)) {
                cout << a[j] << " ";
            }
        }
        cout << endl;
    }
}