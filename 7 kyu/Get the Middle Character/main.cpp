#include <string>

using namespace std;

string get_middle(string input)
{
    return input.length() % 2 == 0 ? input.substr(input.length() / 2 - 1, 2) : input.substr(input.length() / 2, 1);
}