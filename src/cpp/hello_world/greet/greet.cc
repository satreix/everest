#include "greet.h"

#include <string>

#include <fmt/core.h>

namespace greet {
std::string
greet(std::string name)
{
  return fmt::format("Hello, {}!", name);
}
}
