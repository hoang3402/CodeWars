#include <iostream>
#include <list>
#include <math.h>
#include <string>
#include <vector>

using namespace std;

// Function to find b % a
int Modulo(int a, string b)
{
    // Initialize result
    int mod = 0;

    // calculating mod of b with a to make
    // b like 0 <= b < a
    for (int i = 0; i < b.length(); i++)
        mod = (mod * 10 + b[i] - '0') % a;

    return mod; // return modulo
}

int last_digit(const string& str1, const string& str2)
{
    int len_a = str1.length();
    int len_b = str2.length();

    // if a and b both are 0
    if (len_a == 1 && len_b == 1 && str1[0] == '0' && str2[0] == '0')
        return 1;

    // if exponent is 0
    if (len_b == 1 && str2[0] == '0')
        return 1;

    // if base is 0
    if (len_a == 1 && str1[0] == '0')
        return 0;

    // if exponent is divisible by 4 that means last
    // digit will be pow(a, 4) % 10.
    // if exponent is not divisible by 4 that means last
    // digit will be pow(a, b%4) % 10
    int exp = (Modulo(4, str2) == 0) ? 4 : Modulo(4, str2);

    // Find last digit in 'a' and compute its exponent
    int res = pow(str1[len_a - 1] - '0', exp);

    // Return last digit of result
    return res % 10;
}

#include <cmath>

int last_digit(std::string str1, std::string str2)
{
    // If power = zero, return 1
    if (str2 == "0")
        return 1;
    // Read base
    int base = str1.back() - '0';
    // If base doesn`t change with power, return base
    if (base == 0 || base == 1 || base == 5 || base == 6)
        return base;
    // Read power
    int second = str2.back() - '0';
    if (str2.size() > 1)
        second += (str2[str2.size() - 2] - '0') * 10;
    // Return last digit of pow(base, rest of full cycle)
    base = (base == 4 || base == 9) ? pow(base, second % 2 + 2) : pow(base, second % 4 + 4);
    return base % 10;
}

#include <string>

constexpr int powers[10][4] = {
    /*0*/ { 0, 0, 0, 0 },
    /*1*/ { 1, 1, 1, 1 },
    /*2*/ { 6, 2, 4, 8 },
    /*3*/ { 1, 3, 9, 7 },
    /*4*/ { 6, 4, 6, 4 },
    /*5*/ { 5, 5, 5, 5 },
    /*6*/ { 6, 6, 6, 6 },
    /*7*/ { 1, 7, 9, 3 },
    /*8*/ { 6, 8, 4, 2 },
    /*9*/ { 1, 9, 1, 9 }
};

int last_digit(std::string str1, std::string str2)
{
    if (str2 == "0")
        return 1;
    int lastDigit1 = str1[str1.size() - 1] - 48;
    int rest4_2;
    if (str2.size() > 2)
        rest4_2 = std::stoi(str2.substr(str2.size() - 2)) % 4;
    else
        rest4_2 = std::stoi(str2) % 4;
    return powers[lastDigit1][rest4_2];
}

#include <cmath>
#include <string>

int last_digit(const std::string& sa, const std::string& sb)
{
    if (sb == "0")
        return 1;
    const int
        a1
        = sa.back() - '0',
        bm4 = (sb.size() == 1 ? sb.back() - '0' : (sb[sb.size() - 2] - '0') * 10 + (sb.back() - '0')) % 4,
        b1 = bm4 != 0 ? bm4 : 4;
    return int(std::pow(a1, b1)) % 10;
}