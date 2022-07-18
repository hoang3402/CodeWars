#include <bits/stdc++.h>

using namespace std;

string how_much_i_love_you(int nb_petals)
{
    switch(nb_petals % 6) {
        case 0: return "not at all"; break;
        case 1: return "I love you"; break;
        case 2: return "a little"; break;
        case 3: return "a lot"; break;
        case 4: return "passionately"; break;
        case 5: return "madly"; break;
        default: return "Error";
    }
}

std::string how_much_i_love_you_2(int nb_petals)
{
  static const std::vector<std::string> sentences
  {  
    "I love you", 
    "a little",
    "a lot", 
    "passionately",
    "madly", 
    "not at all"
  };
  
  return sentences[(nb_petals-1) % sentences.size()];
}