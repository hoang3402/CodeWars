#include "bits/stdc++.h"

using namespace std;

string add(string a, string b)
{
    string result;
    int t = 0, s;
    reverse(a.begin(), a.end());
    reverse(b.begin(), b.end());
    int n = a.length(), m = b.length();
    if (n > m) {
        b.append(n - m, '0');
    } else {
        a.append(m - n, '0');
    }
    n = a.length();
    for (int i = 0; i < n; i++) {
        s = (a[i] - '0') + (b[i] - '0') + t;
        t = s > 9 ? 1 : 0;
        if (s > 9) {
            result.push_back((s + '0' - 10));
        } else {
            result.push_back((s + '0'));
        }
    }
    if (t) {
        result.push_back(t + '0');
    }
    reverse(result.begin(), result.end());
    return result;
}

using namespace std;

string add_2(string a, string b)
{
    a = string(max(a.size(), b.size()) + 1 - a.size(), '0') + a;
    b = string(a.size() - b.size(), '0') + b;
    for (int i = a.size() - 1, carry = 0; i >= 0; i--) {
        int sum = a[i] + b[i] - 96 + carry;
        carry = sum / 10;
        a[i] = sum % 10 + '0';
    }
    int i = a.find_first_not_of('0');
    return 0 <= i ? a.substr(i) : a.substr(0, 1);
}

#include <string>

std::string add_3(std::string a, std::string b)
{
    if (a.size() < b.size())
        std::swap(a, b);
    a.insert(0, "0");
    b.insert(0, a.size() - b.size(), '0');

    for (int i = a.size() - 1, j = b.size() - 1; j >= 0; --i, --j) {
        a[i] += b[j] - 2 * '0';
        a[i - 1] += a[i] / 10;
        a[i] = a[i] % 10 + '0';
    }

    int t = a.find_first_not_of('0');
    if (t == std::string::npos)
        return "0";
    else
        return a.substr(t, a.size() - t);
}