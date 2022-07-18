#include <algorithm>
#include <string>

class CountDig {
public:
    static int nbDig(int n, int d);
};

int CountDig::nbDig(int n, int d)
{
    int count = 0;
    for (int i = 0; i <= n; i++) {
        std::string s = std::to_string(i * i);
        count += std::count(s.begin(), s.end(), std::to_string(d)[0]);
    }
    return count;
}