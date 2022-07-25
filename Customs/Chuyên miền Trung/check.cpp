#include <bits/stdc++.h>
using namespace std;

int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    int n;
    cin >> n;
    vector<long long> a(n + 1);
    for (int i = 1; i <= n; ++i) {
        cin >> a[i];
    }
    vector<bool> b(n + 1, true);
    for (int p = 2; p * p <= n; ++p) {
        if (b[p] == true) {
            for (int i = p * p; i <= n; i += p)
                b[i] = false;
        }
    }
    long long Max = a[2];
    for (int L = 2; L <= n; ++L) {
        if (b[L] == true) {
            long long sum = a[L];
            Max = max(Max, sum);
            for (int R = L + 1; R <= n; ++R) {
                sum += a[R];
                if (b[R] == true) {
                    Max = max(Max, sum);
                }
            }
        }
    }
    return Max;
}