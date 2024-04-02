#include <string>

std::string format_duration(int seconds)
{
    if (seconds == 0)
        return "now";

    int years = seconds / 31536000;
    int days = (seconds % 31536000) / 86400;
    int hours = (seconds % 86400) / 3600;
    int minutes = (seconds % 3600) / 60;
    int seconds_ = seconds % 60;

    std::string years_str = years ? std::to_string(years) + " year" + (years > 1 ? "s" : "") + ", " : "";
    std::string days_str = days ? std::to_string(days) + " day" + (days > 1 ? "s" : "") + ", " : "";
    std::string hours_str = hours ? std::to_string(hours) + " hour" + (hours > 1 ? "s" : "") + ", " : "";
    std::string minutes_str = minutes ? std::to_string(minutes) + " minute" + (minutes > 1 ? "s" : "") + ", " : "";
    std::string seconds_str = seconds_ ? std::to_string(seconds_) + " second" + (seconds_ > 1 ? "s" : "") : "";

    std::string result = years_str + days_str + hours_str + minutes_str + seconds_str;
    size_t last_index = result.find_last_of(",");
    if (last_index != std::string::npos && last_index < result.length() - 3) {
        result.replace(last_index, 1, ", and");
    }
    // Remove the last comma if present
    if (result.back() == ',') {
        result.pop_back();
    }
    return result;
}

// ---

std::string format_duration(int seconds)
{
    if (seconds == 0)
        return "now";

    std::vector<std::string> times;
    auto add = [&](auto text, auto time) {
        if (time == 0)
            return;
        times.push_back(std::to_string(time) + text + (time > 1 ? "s" : ""));
    };
    add(" year", seconds / 31536000);
    add(" day", (seconds / 86400) % 365);
    add(" hour", (seconds / 3600) % 24);
    add(" minute", (seconds / 60) % 60);
    add(" second", seconds % 60);

    std::string result = times[0];
    for (auto i = 1; i < times.size() - 1; i++)
        result.append(", " + times[i]);
    if (times.size() > 1)
        result.append(" and " + times.back());

    return result;
}