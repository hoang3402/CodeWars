#include <assert.h>
#include <vector>
#include <ctime>
#include <iostream>

using namespace std;
int maxSequence(const vector<int> &arr) noexcept
{
    // Solution
}

vector<int> randomArray(int s)
{
    vector<int> vi;
    for (int i = 0; i < s; ++i)
        vi.push_back(rand() % 61 - 30);
    return vi;
}

int main()
{
    srand(time(0));
    for (int i = 0; i < 50; ++i)
    {
        vector<int> ary = randomArray(50);
        int result = maxSequence(ary);
        assert((maxSequence(ary), result));
    }
}