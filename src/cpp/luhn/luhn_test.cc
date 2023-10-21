#include <gtest/gtest.h>

#include "src/cpp/luhn/luhn.h"

TEST(LuhnTest, ValidNumber) {
    ASSERT_TRUE(luhn::check(4111111111111111));
}

TEST(LuhnTest, InvalidNumber) {
    ASSERT_FALSE(luhn::check(4111111111111112));
}
