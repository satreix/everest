#include <gtest/gtest.h>
#include "greet.h"

TEST(GreetTest, NameNotProvided) {
  EXPECT_EQ(greet::greet(), "Hello, World!");
}

TEST(GreetTest, NameProvided) {
  EXPECT_EQ(greet::greet("Gtest"), "Hello, Gtest!");
}
