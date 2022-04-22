#include <iostream>

#include "gflags/gflags.h"

#include "src/cpp/hello_world/greet/greet.h"

DEFINE_string(name, "World", "name to greet");

int
main(int argc, char **argv)
{
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  std::cout << greet::greet(FLAGS_name) << std::endl;
  return 0;
}
