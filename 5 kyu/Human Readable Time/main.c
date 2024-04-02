// HH = hours, padded to 2 digits, range: 00 - 99
// MM = minutes, padded to 2 digits, range: 00 - 59
// SS = seconds, padded to 2 digits, range: 00 - 59

char* human_readable_time(unsigned seconds, char* time_string)
{
    *time_string = '\0';

    unsigned hours = seconds / 3600;
    unsigned minutes = (seconds % 3600) / 60;
    unsigned seconds_remainder = seconds % 60;

    snprintf(time_string, 9, "%02u:%02u:%02u", hours, minutes, seconds_remainder);

    return time_string;
}