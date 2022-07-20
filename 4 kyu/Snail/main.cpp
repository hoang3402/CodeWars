#include <vector>

std::vector<int> snail(const std::vector<std::vector<int>>& snail_map)
{
    if (snail_map.empty()) {
        return {};
    }
    int lenght = snail_map.size();
    std::vector<int> result;
    int i = 0, j = 0;
    while (j <= lenght) {
        int n = 0, m = 0;
        while (m < snail_map[i].size() - j) {
            result.push_back(snail_map[i][m]);
        }
    }

    return result;
}