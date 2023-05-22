#include <vector>
#include <math.h>
#include <iostream>

using namespace std;

int sumDigNthTerm(int initval, const vector<int> patternl, int nthterm)
{
    int n = initval;
    int lenght = patternl.size();

    for (int i = 0; i < nthterm - 1; i++)
    {
        n += patternl[i % lenght];
    }

    int result = 0;
    while (n > 0)
    {
        result += n % 10;
        n /= 10;
    }

    return result;
}

int main()
{
    vector<int> a{2, 1, 3};
    cout << sumDigNthTerm(10, a, 6) << endl;

    return 0;
}