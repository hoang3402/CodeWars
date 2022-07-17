// Tự giải :D
#include <stdlib.h>
class GpsSpeed {
public:
    static int gps(int s, std::vector<double>& x)
    {
        if (x.size() == 0)
            return 0;
        double max = 0;
        for (unsigned long i = 0; i < x.size() - 1; i++) {
            std::cout << x[i] << " " << x[i + 1] << " " << s << std::endl;
            double temp = (3600 * abs((x[i] - x[i + 1]))) / s * 1.0;
            if (abs(temp) > max) {
                max = abs(temp);
            }
        }
        return max;
    }
};

// hmm...
class GpsSpeed {
public:
    static int gps(int s, std::vector<double>& x)
    {
        if (x.size() < 1)
            return 0;
        std::vector<double> bar(x.size());
        std::transform(x.begin() + 1, x.end(), x.begin(), bar.begin(), std::minus<double>());
        return (3600 * (*max_element(bar.begin(), bar.end())) / s);
    }
};

class GpsSpeed {
public:
    static int gps(int s, std::vector<double>& x)
    {
        int max = 0;
        for (int i = 1; i < x.size(); ++i) {
            double dist = x[i] - x[i - 1];
            double speed = dist * 3600.0 / s;
            if (speed > max) {
                max = speed;
            }
        }
        return max;
    }
};

#include <cmath>
class GpsSpeed {
public:
    static int gps(int s, std::vector<double>& x)
    {
        if (x.size() <= 1)
            return 0;
        std::vector<double> avgSpeed {}; // var for storing average speed
        for (int i = 0; i < x.size() - 1; ++i) {
            avgSpeed.push_back(((x[i + 1] - x[i]) * (3600)) / s);
        }
        return (floor(*max_element(avgSpeed.begin(), avgSpeed.end()))); // take floor of max element
    }
};