int makeNegative(int num)
{
    return num < 0 ? num : -num;
}

// không ok :|
#include <cmath>
int makeNegative(int num)
{
    return -abs(num);
}