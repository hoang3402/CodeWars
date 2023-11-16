using ull = unsigned long long;

ull exp_sum(unsigned int num)
{
    std::vector<ull> ways(num + 1, 0);
    ways[0] = 1;

    for (unsigned int i = 1; i <= num; i++) {
        for (unsigned int j = i; j <= num; j++) {
            ways[j] += ways[j - i];
        }
    }

    return ways[num];
}