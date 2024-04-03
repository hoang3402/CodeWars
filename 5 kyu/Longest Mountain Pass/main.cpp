#include <iostream>
#include <utility>
#include <vector>

std::pair<int, int> longest_mountain_pass(const std::vector<int>& mountains, int energy)
{
    int n = mountains.size();
    if (n < 2) {
        return { 0, 0 };
    }

    int max_length = 0;
    int start_index = 0;

    std::vector<int> energy_cost(n, 0);

    for (int i = 0; i < n; i++) {
        energy_cost[i] = std::max(mountains[i + 1] - mountains[i], 0);
    }

    for (int i = 0; i < n; ++i) {
        int current_energy = energy;
        int length = 1; // A pass of at least one mountain is always possible

        for (int j = i + 1; j < n && current_energy > -1; ++j) {
            if (energy_cost[j - 1] > 0) { // Going uphill
                if (current_energy < energy_cost[j - 1]) {
                    break; // Not enough energy to climb
                }
                current_energy -= energy_cost[j - 1];
            }
            length++;
        }

        if (length > max_length) {
            max_length = length;
            start_index = i;
        }
    }

    return { max_length, start_index };
}
