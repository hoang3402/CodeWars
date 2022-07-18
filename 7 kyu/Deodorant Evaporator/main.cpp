class Evaporator {

public:
    static int evaporator(double content, double evap_per_day, double threshold)
    {
        int count = 0;
        threshold = content * threshold / 100;
        while (content >= threshold) {
            double temp = content * evap_per_day / 100;
            content -= temp;
            count++;
        }
        return count;
    }
};

#include <cmath>

using namespace std;
class Evaporator2
{

  public:
  static int evaporator(double, double evap_per_day, double threshold);
};

int Evaporator2::evaporator(double, double evap_per_day, double threshold) {
  const double evapFactor {(100.0 - evap_per_day) / 100.0};
  const double normalizedThreshold {threshold / 100.0};
  const double daysToThreshold {std::log (normalizedThreshold) / std::log(evapFactor)};
  
  return static_cast <int> (std::ceil(daysToThreshold));
}

#include <cmath>

using namespace std;
class Evaporator3
{

  public:
  static int evaporator(double content, double evap_per_day, double threshold);
};

int Evaporator3::evaporator(double content, double evap_per_day, double threshold)
{
  // Finding N in (1.0-evap_per_day) to the N is less than threshold
  // Which is logarithm of threshold in base (1.0-evap_per_day), rounded up
  // C++ stdlib doesn't give you arbitrary log, but log of N in base B == logN/logB for any base
  // Also, don't forget that the percentages are being given as read (i.e. 10) not real numbers (0.1)
  return ceil(log(threshold/100.0)/log(1.0-(evap_per_day/100.0)));
}

#include <cmath>

using namespace std;

class Evaporator4
{

  public:
  static int evaporator(double content, double evap_per_day, double threshold);
};

int Evaporator4::evaporator(double content, double evap_per_day, double threshold)
{
  return static_cast<int>(ceil(log(threshold / 100.0) / log(1.0 - evap_per_day / 100.0)));
}