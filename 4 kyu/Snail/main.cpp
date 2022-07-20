#include <vector>

// { 1, 2, 3, 4 },
// { 12, 13, 14, 5 },
// { 11, 16, 15, 6 },
// { 10, 9, 8, 7 }

std::vector<int> snail(const std::vector<std::vector<int>>& snail_map)
{
    if (snail_map.empty()) {
        return {};
    }

    if (snail_map.size() == 1) {
        return snail_map[0];
    }

    std::vector<int> result;
    int I = 0, // start
        II = snail_map.size() - 1, // end
        III = 0, // start
        IV = snail_map.size() - 1, // end
        lenght = snail_map.size();

    for (int i = 0; i < lenght / 2; i++) {
        for (int first = I; first <= II; first++) {
            result.push_back(snail_map[III][first]);
        }
        III++;
        for (int second = III; second <= IV; second++) {
            result.push_back(snail_map[second][II]);
        }
        II--;
        for (int third = II; third >= I; third--) {
            result.push_back(snail_map[IV][third]);
        }
        IV--;
        for (int third = IV; third >= III; third--) {
            result.push_back(snail_map[third][I]);
        }
        I++;
    }

    if (lenght % 2 != 0) {
        result.push_back(snail_map[I][III]);
    }

    return result;
}

#include <cstddef>
#include <vector>

std::vector<int> snail_2(const std::vector<std::vector<int>>& xs)
{
    std::vector<int> res;
    if (xs[0].empty())
        return res;
    const std::size_t ny = xs.size(),
                      nx = xs[0].size();
    res.reserve(ny * nx);
    std::ptrdiff_t x0 = 0,
                   y0 = 0,
                   x1 = nx - 1,
                   y1 = ny - 1,
                   x = 0,
                   y = 0;
    while (y0 <= y1) {
        while (x < x1)
            res.push_back(xs[y][x++]);
        y0++;
        while (y < y1)
            res.push_back(xs[y++][x]);
        x1--;
        while (x > x0)
            res.push_back(xs[y][x--]);
        y1--;
        while (y > y0)
            res.push_back(xs[y--][x]);
        x0++;
    }
    res.push_back(xs[y][x]);
    return res;
}

#include <vector>
using namespace std;
inline vector<int> snail_3(vector<vector<int>> array)
{
    int leftlimit = 0, uplimit = 0, rightlimit = array[0].size() - 1, downlimit = rightlimit, cx = -1, cy = -1;
    vector<int> ans;
    while (leftlimit <= rightlimit) {
        for (cy++, uplimit++, cx++; cx <= rightlimit; cx++)
            ans.push_back(array[cy][cx]);
        for (cx--, rightlimit--, cy++; cy <= downlimit; cy++)
            ans.push_back(array[cy][cx]);
        for (cy--, downlimit--, cx--; cx >= leftlimit; cx--)
            ans.push_back(array[cy][cx]);
        for (cx++, leftlimit++, cy--; cy >= uplimit; cy--)
            ans.push_back(array[cy][cx]);
    }
    return ans;
}