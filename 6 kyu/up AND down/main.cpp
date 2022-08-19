#include <algorithm>
#include <map>
#include <numeric>
#include <string>

class UpAndDown {
public:
    static std::string arrange(const std::string& strng);
};

std::string UpAndDown::arrange(const std::string& strng)
{
    std::string result;
    // Create map
    std::map<std::string, int> m;
    for (unsigned long i = 0, start = 0; i < strng.size(); ++i) {
        if (strng[i] == ' ' || strng[i] == '\n') {
            std::string temp = strng.substr(start, i - start);
            m.insert(std::make_pair(temp, temp.length()));
            start = i + 1;
        }
    }

    // sort map using second element
    std::sort(m.begin(), m.end());
    std::accumulate(m.begin(), m.end(), result);

    return result;
}