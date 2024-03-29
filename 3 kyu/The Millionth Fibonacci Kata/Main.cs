using System.Numerics;

public class Fibonacci
{

    public static BigInteger fib(int n)
    {
        if (n == 0) return 0;
        if (n == 1 || n == 2) return 1;
        bool isNegative = false;
        if (n < 0) {
          n = -n;
          if (n % 2 == 0) {
            isNegative = true;
          }
        };
        return isNegative ? -powMatrix(new BigInteger[,] { { 1, 1 }, { 1, 0 } }, n)[0, 1] :
                            powMatrix(new BigInteger[,] { { 1, 1 }, { 1, 0 } }, n)[0, 1];
    }
  
    public static BigInteger[,] powMatrix(BigInteger[,] baseMatrix, BigInteger exponent)
    {
        BigInteger[,] result = new BigInteger[,] { { 1, 0 }, { 0, 1 } };
        BigInteger[,] a = baseMatrix;

        while (exponent > 0)
        {
            if (exponent % 2 == 1)
            {
                result = multiplyMatrix(result, a);
            }
            a = multiplyMatrix(a, a);
            exponent /= 2;
        }

        return result;
    }

    public static BigInteger[,] multiplyMatrix(BigInteger[,] a, BigInteger[,] b)
    {
        return new BigInteger[,]
        {
            { a[0, 0] * b[0, 0] + a[0, 1] * b[1, 0], a[0, 0] * b[0, 1] + a[0, 1] * b[1, 1] },
            { a[1, 0] * b[0, 0] + a[1, 1] * b[1, 0], a[1, 0] * b[0, 1] + a[1, 1] * b[1, 1] }
        };
    }
}

// 

using System;
using System.Numerics;
public class Fibonacci
{
    public static BigInteger fib(int n)
    {
        BigInteger semn =1;
        BigInteger t = 0;
        BigInteger i = 1;
        BigInteger j = 0;
        BigInteger k = 0;
        BigInteger h = 1;

        if (n < 0)
        {
            n *= -1;
            semn =n%2==0? -1:1;
        }

        while (n > 0)
        {

            if (n % 2 != 0)
            {
                t = j * h;
                j = i * h + j * k + t;
                i = i * k + t;
            }
            t = h * h;
            h = 2 * k * h + t;
            k = k * k + t;
            n = n / 2;
        }
        return j*semn;
    }
}