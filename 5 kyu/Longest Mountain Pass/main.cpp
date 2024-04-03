#include <iostream>
#include <utility>
#include <vector>

std::pair<int, int> longest_mountain_pass(const std::vector<int>& mountains, int energy)
{
    if (mountains.size() < 2) {
        return { 0, 0 };
    }
    unsigned long max_length = 1;
    unsigned long start_index = 128;

    for (unsigned long i = 0; i < mountains.size() - 1; ++i) {
        int _energy = energy;
        unsigned long j = i;
        unsigned long step = 0;
        while (j < mountains.size() && _energy >= 0) {
            if (mountains[j] < mountains[j + 1]) {
                _energy -= mountains[j + 1] - mountains[j];
                step++;
                if (_energy < 0) {
                    break;
                }
            }
            if (mountains[j] >= mountains[j + 1]) {
                step++;
            }
            j++;
        }
        if (step > max_length) {
            max_length = step;
            start_index = i;
        }
        if (step >= mountains.size() - 1) {
            break;
        }
    }

    return { max_length, start_index == 128 ? 0 : start_index };
}
