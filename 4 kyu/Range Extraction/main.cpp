#include <iostream>
#include <string>

using namespace std;

int abs(int a)
{
    return a > 0 ? a : -a;
}

int is(int a, int b)
{
    cout << a << "/" << b << endl;
    return abs(abs(a) - abs(b));
}

string range_extraction(vector<int> args)
{
    string result = "";
    int end;
    const int length = args.size();

    for (int i = 0; i < length; ++i) {
        int temp_value = args[i];
        end = i;

        do {
            if (is(++temp_value, args[++end]) == 1) {
                break;
            }
            if (end >= length)
                break;
        } while (temp_value + 1 == args[end + 1]);

        if (end - i == 1) {
            result += to_string(args[i]) + ",";
            i = end - 1;
        } else {
            result += to_string(args[i]) + "-" + to_string(args[end]) + ",";
            i = end;
        }
        if (i >= length)
            break;
    }

    return result.substr(0, result.length() - 1);
}