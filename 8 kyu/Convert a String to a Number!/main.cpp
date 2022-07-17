#include <bits/stdc++.h>

int string_to_number(const std::string& s)
{
    return stoi(s);
}

#include <cmath>
#include <string>

int char_to_digit(char ch);

int string_to_number(const std::string& input)
{
    int result = 0;

    for (int i = 0; i < input.length(); i++) {
        char current = input[input.length() - 1 - i];
        if (current == '-')
            result = -result;
        else
            result += char_to_digit(current) * std::pow(10, 1 * i);
    }

    return result;
}

int char_to_digit(char ch)
{
    switch (ch) {
    case '0':
        return 0;
    case '1':
        return 1;
    case '2':
        return 2;
    case '3':
        return 3;
    case '4':
        return 4;
    case '5':
        return 5;
    case '6':
        return 6;
    case '7':
        return 7;
    case '8':
        return 8;
    case '9':
        return 9;

    default:
        return -1;
    }
}