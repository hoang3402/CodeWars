using System;

public static class Kata
{
    public static int MakeNegative(int number)
    {
        return number > 0 ? -number : number;
    }
}


public static class Kata
{
    public static int MakeNegative(int number)
    {
        return -Math.Abs(number);
    }
}