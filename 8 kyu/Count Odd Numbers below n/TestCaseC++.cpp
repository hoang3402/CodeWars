#include<ctime>
#include<cstdlib>

Describe(basic_tests)
{
    It(test1)
    {
        Assert::That(odd_count(15), Equals(7));
    }
     It(test2)
    {
        Assert::That(odd_count(15023), Equals(7511));
    }
};

Describe(Random_tests)
{
    It(randomized_test)
    {
        srand(time(NULL));
        for(int i = 0; i < 200; i++) {
            int C = std::rand();
            int expected = C/2;
            Assert::That(odd_count(C) , Equals(expected));
        }
    }
};