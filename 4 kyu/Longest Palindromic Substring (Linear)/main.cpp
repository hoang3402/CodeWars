#include <iostream>
#include <string>

using namespace std;

bool isPalindrome(const string& input, int start, int end)
{
    while (start < end) {
        if (input[start] != input[end]) {
            return false;
        }
        start++;
        end--;
    }
    return true;
}

string longest_palindrome(string input)
{
    int stringLength = input.length();
    if (stringLength <= 1)
        return input;

    string result = "";

    for (int i = 0; i < stringLength; i++) {
        for (int j = stringLength - 1; j > i; j--) {
            if (input[i] != input[j] || (unsigned long)j - i + 1 <= result.length())
                continue;

            if (!isPalindrome(input, i, j))
                continue;

            result = input.substr(i, j - i + 1);
            i = i + 1;
            j = stringLength;
        }
    }

    if (result.empty()) {
        result = input.substr(0, 1);
    }

    return result;
}

// 

#include<iostream>
#include<string>

using namespace std;

string palindrome(string s, unsigned long i, unsigned long j) {
    while ( i >= 0 && j < s.length() && s[i] == s[j])
    {
        i--;
        j++;
    }
    return s.substr(i + 1, j  -1 - i);   
}


string longest_palindrome(string input){
    string maxp = "";
    for (int i = 0; i < input.length(); i++) {
        string s1 = palindrome(input, i, i);
        string s2 = palindrome(input, i, i + 1);
        maxp = maxp.length() < s1.length() ? s1 : maxp;
        maxp = maxp.length() < s2.length() ? s2 : maxp;
    }
    return maxp;
}