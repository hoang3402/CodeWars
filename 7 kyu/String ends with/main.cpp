#include <string>
bool solution(std::string const& str, std::string const& ending)
{
    return str.size() >= ending.size() && str.substr(str.size() - ending.size()) == ending;
}