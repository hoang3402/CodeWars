#include <iostream>
#include <list>
#include <math.h>

using namespace std;
int last_digit(list<int> array)
{
    if (array.size() == 0)
        return 1;
    if (array.size() == 1)
        return array.front() % 10;
    while (array.size() > 2) {
        int SoMu = array.back() < 4 ? array.back() : array.back() % 4 + 4;
        array.pop_back();
        int Base = array.back() < 4 ? array.back() : array.back() % 4 + 4;
        array.pop_back();
        array.push_back(pow(Base, SoMu));
    }
    int SoMu = array.back() < 4 ? array.back() : array.back() % 4 + 4;
    array.pop_back();
    int Base = array.back() % 10;
    return (int)(pow(Base, SoMu)) % 10;
}