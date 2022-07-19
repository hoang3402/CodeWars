int digital_root(int n)
{
    int result = 0;

    while (n > 0) {
        result += n % 10;

        n /= 10;
    }

    return result >= 10 ? digital_root(result) : result;
}

int digital_root_2(int Z)
{
    return --Z % 9 + 1;
}

int digital_root_3(int n)
{
    return (n - 1) % 9 + 1;
}