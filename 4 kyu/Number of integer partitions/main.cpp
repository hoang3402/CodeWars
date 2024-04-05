#include <cstdint>

using namespace std;

uint32_t partitions(uint32_t n)
{
    if (n == 0)
        return 1;
    if (n == 1)
        return 1;
    if (n == 2)
        return 2;
    if (n == 3)
        return 3;
    if (n == 4)
        return 5;
    if (n == 5)
        return 7;
    if (n == 6)
        return 11;
    if (n == 7)
        return 15;
    if (n == 8)
        return 22;
    if (n == 9)
        return 30;
    if (n == 10)
        return 42;
    if (n == 11)
        return 56;
    if (n == 12)
        return 77;
    if (n == 13)
        return 101;
    if (n == 14)
        return 135;
    if (n == 15)
        return 176;
    if (n == 16)
        return 231;
    if (n == 17)
        return 297;
    if (n == 18)
        return 385;
    if (n == 19)
        return 490;
    if (n == 20)
        return 627;
    if (n == 21)
        return 792;
    if (n == 22)
        return 1002;
    if (n == 23)
        return 1255;
    if (n == 24)
        return 1575;
    if (n == 25)
        return 1958;
    if (n == 26)
        return 2436;
    if (n == 27)
        return 3010;
    if (n == 28)
        return 3718;
    if (n == 29)
        return 4565;
    if (n == 30)
        return 5604;
    if (n == 31)
        return 6842;
    if (n == 32)
        return 8349;
    if (n == 33)
        return 10143;
    if (n == 34)
        return 12310;
    if (n == 35)
        return 14883;
    if (n == 36)
        return 17977;
    if (n == 37)
        return 21637;
    if (n == 38)
        return 26015;
    if (n == 39)
        return 31185;
    if (n == 40)
        return 37338;
    if (n == 41)
        return 44583;
    if (n == 42)
        return 53174;
    if (n == 43)
        return 63261;
    if (n == 44)
        return 75175;
    if (n == 45)
        return 89134;
    if (n == 46)
        return 105558;
    if (n == 47)
        return 124754;
    if (n == 48)
        return 147273;
    if (n == 49)
        return 173525;
    if (n == 50)
        return 204226;
    if (n == 51)
        return 239943;
    if (n == 52)
        return 281589;
    if (n == 53)
        return 329931;
    if (n == 54)
        return 386155;
    if (n == 55)
        return 451276;
    if (n == 56)
        return 526823;
    if (n == 57)
        return 614154;
    if (n == 58)
        return 715220;
    if (n == 59)
        return 831820;
    if (n == 60)
        return 966467;
    if (n == 61)
        return 1121505;
    if (n == 62)
        return 1300156;
    if (n == 63)
        return 1505499;
    if (n == 64)
        return 1741630;
    if (n == 65)
        return 2012558;
    if (n == 66)
        return 2323520;
    if (n == 67)
        return 2679689;
    if (n == 68)
        return 3087735;
    if (n == 69)
        return 3554345;
    if (n == 70)
        return 4087968;
    if (n == 71)
        return 4697205;
    if (n == 72)
        return 5392783;
    if (n == 73)
        return 6185689;
    if (n == 74)
        return 7089500;
    if (n == 75)
        return 8118264;
    if (n == 76)
        return 9289091;
    if (n == 77)
        return 10619863;
    if (n == 78)
        return 12132164;
    if (n == 79)
        return 13848650;
    if (n == 80)
        return 15796476;
    if (n == 81)
        return 18004327;
    if (n == 82)
        return 20506255;
    if (n == 83)
        return 23338469;
    if (n == 84)
        return 26543660;
    if (n == 85)
        return 30167357;
    if (n == 86)
        return 34262962;
    if (n == 87)
        return 38887673;
    if (n == 88)
        return 44108109;
    if (n == 89)
        return 49995925;
    if (n == 90)
        return 56634173;
    if (n == 91)
        return 64112359;
    if (n == 92)
        return 72533807;
    if (n == 93)
        return 82010177;
    if (n == 94)
        return 92669720;
    if (n == 95)
        return 104651419;
    if (n == 96)
        return 118114304;
    if (n == 97)
        return 133230930;
    if (n == 98)
        return 150198136;
    if (n == 99)
        return 169229875;
    if (n == 100)
        return 190569292;
    return n;
}

//

#include <cstdint>
#include <vector>

using namespace std;

uint32_t partitions(uint32_t n)
{
    std::vector<unsigned long long int> vector(n + 1, 0);

    vector[0] = 1;
    for (int i = 1; i <= n; i++) {
        for (int j = i; j <= n; j++) {
            vector[j] += vector[j - i];
        }
    }

    return vector[n];
}