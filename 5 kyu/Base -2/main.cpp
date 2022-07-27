#include <algorithm>
#include <math.h>
#include <stack>
#include <string>

using namespace std;

class Negabinary {
public:
    static string ToNegabinary(int i)
    {
        if (i == 0) {
            return "0";
        }

        string result;
        stack<int> stack;

        while (i != 0) {
            int remainder = i % -2;
            i /= -2;
            if (remainder < 0) {
                remainder -= (-2);
                i += 1;
            }
            stack.push(remainder);
        }

        while (!stack.empty()) {
            result += to_string(stack.top());
            stack.pop();
        }

        return result;
    }

    static int ToInt(string s)
    {
        int result = 0, index = 0;
        reverse(s.begin(), s.end());
        for (auto i : s) {
            if (i - '0' != 0) {
                result += pow(-2, index);
            }
            index++;
        }

        return result;
    }
};