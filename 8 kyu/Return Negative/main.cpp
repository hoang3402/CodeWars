int makeNegative(int num)
{
    return num < 0 ? num : -num;
}

// không ok :|
#include <cmath>
int makeNegative2(int num)
{
    return -abs(num);
}