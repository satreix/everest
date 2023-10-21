#include <string>

namespace luhn {

bool check(long long n) {
    std::string str = std::to_string(n);
    int checksum = 0;
    bool even = false;

    for (auto it = str.rbegin(); it != str.rend(); ++it) {
        int digit = *it - '0';
        if (even) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        checksum += digit;
        even = !even;
    }

    return checksum % 10 == 0;
}

} // namespace luhn
