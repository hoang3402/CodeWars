int odd_count(int n){
  //if n = even: odd numbers below n is n/2 
  //if n = odd: odd numbers below n is n/2 rounded down, which C++ will do for us
  return n/2;
}

int odd_count_2(int n)
{
    int i = 1, count = 0;
    while (i < n) {
        i += 2;
        count++;
    }
    return count;
}