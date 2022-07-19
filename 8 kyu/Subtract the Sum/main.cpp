#include <bits/stdc++.h>

using namespace std;

int sumNumber(int n)
{
    int sum = 0;
    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

string subtractSum(int n)
{
    while (n > 100) {
        vector<char> sum(n);
        auto temp = sumNumber(n);
        n -= temp;
    }

    switch (n) {
    case 1:
        return "kiwi";
    case 2:
        return "pear";
    case 3:
        return "kiwi";
    case 4:
        return "banana";
    case 5:
        return "melon";
    case 6:
        return "banana";
    case 7:
        return "melon";
    case 8:
        return "pineapple";
    case 9:
        return "apple";
    case 10:
        return "pineapple";
    case 11:
        return "cucumber";
    case 12:
        return "pineapple";
    case 13:
        return "cucumber";
    case 14:
        return "orange";
    case 15:
        return "grape";
    case 16:
        return "orange";
    case 17:
        return "grape";
    case 18:
        return "apple";
    case 19:
        return "grape";
    case 20:
        return "cherry";
    case 21:
        return "pear";
    case 22:
        return "cherry";
    case 23:
        return "pear";
    case 24:
        return "kiwi";
    case 25:
        return "banana";
    case 26:
        return "kiwi";
    case 27:
        return "apple";
    case 28:
        return "melon";
    case 29:
        return "banana";
    case 30:
        return "melon";
    case 31:
        return "pineapple";
    case 32:
        return "melon";
    case 33:
        return "pineapple";
    case 34:
        return "cucumber";
    case 35:
        return "orange";
    case 36:
        return "apple";
    case 37:
        return "orange";
    case 38:
        return "grape";
    case 39:
        return "orange";
    case 40:
        return "grape";
    case 41:
        return "cherry";
    case 42:
        return "pear";
    case 43:
        return "cherry";
    case 44:
        return "pear";
    case 45:
        return "apple";
    case 46:
        return "pear";
    case 47:
        return "kiwi";
    case 48:
        return "banana";
    case 49:
        return "kiwi";
    case 50:
        return "banana";
    case 51:
        return "melon";
    case 52:
        return "pineapple";
    case 53:
        return "melon";
    case 54:
        return "apple";
    case 55:
        return "cucumber";
    case 56:
        return "pineapple";
    case 57:
        return "cucumber";
    case 58:
        return "orange";
    case 59:
        return "cucumber";
    case 60:
        return "orange";
    case 61:
        return "grape";
    case 62:
        return "cherry";
    case 63:
        return "apple";
    case 64:
        return "cherry";
    case 65:
        return "pear";
    case 66:
        return "cherry";
    case 67:
        return "pear";
    case 68:
        return "kiwi";
    case 69:
        return "pear";
    case 70:
        return "kiwi";
    case 71:
        return "banana";
    case 72:
        return "apple";
    case 73:
        return "banana";
    case 74:
        return "melon";
    case 75:
        return "pineapple";
    case 76:
        return "melon";
    case 77:
        return "pineapple";
    case 78:
        return "cucumber";
    case 79:
        return "pineapple";
    case 80:
        return "cucumber";
    case 81:
        return "apple";
    case 82:
        return "grape";
    case 83:
        return "orange";
    case 84:
        return "grape";
    case 85:
        return "cherry";
    case 86:
        return "grape";
    case 87:
        return "cherry";
    case 88:
        return "pear";
    case 89:
        return "cherry";
    case 90:
        return "apple";
    case 91:
        return "kiwi";
    case 92:
        return "banana";
    case 93:
        return "kiwi";
    case 94:
        return "banana";
    case 95:
        return "melon";
    case 96:
        return "banana";
    case 97:
        return "melon";
    case 98:
        return "pineapple";
    case 99:
        return "apple";
    case 100:
        return "pineapple";
    }
}

#include <string>
using namespace std;

std::string SubtractSum(int n)
{
    return "apple";
}

/*
Expalantion: note that every multiple of 9 from 1-100 is paired with "apple".

Let digits(n) be the sum of the digits of n.
Claim: Given 10 <= n, n - digits(n) is a multiple of 9.
Proof: Proceeds by induction. The base case is trivial; 10 - 1 = 9. 
       Now, for some n greater than 10, suppose that n - digits(n) = 9 * k for some integer k.
       It suffices to show that (n + 1) - digits(n + 1) = 9 * m for some integer m. 
       If n does not end in a 9, the result follows from the observation that in this case,
       digits(n + 1) = digits(n) + 1; algebra then yields that 
         (n + 1) - digits(n + 1) = n - digits(n) + 1 - 1 = n + digits(n) = 9 * k. 
       Suppose then that n does end in a 9. Consider the digits of n. If all are 9, the result is 
       again immediate: digits(n + 1) = 1 so (n + 1) - digits(n + 1) = n + 1 - 1 = n, which of course
       is a multiple of 9 (as all its digits are 9). If at least one is *not* 9, then the lowest non-9
       digit is incremented (and all 9's before it are set to 0). This means that the relationship
         digits(n + 1) = digits(n) + 1 - 9 * s
       holds where s is an integer (the number of 9's prior to the first non-9 digit). 
       Thus
          (n + 1) - digits(n + 1) = n + 1 - digits(n) - 1 + 9 * s = 9 * (k + s).
       The claim holds by induction. 
*/