#include <getopt.h>
#include <iostream>
#include "src/cpp/hello_world/greet/greet.h"

int
main(int argc, char **argv)
{
  int c;
  std::string name = "World";

  static struct option long_options[] = {
    { "name", required_argument,                 0, 'n'                 },
    {      0,                 0,                 0,                 0   },
  };

  while (1)
  {
    int option_index = 0;
    c = getopt_long(argc, argv, ":d:", long_options, &option_index);

    if (c == -1)
    {
      break;
    }

    switch (c)
    {
      case 0:

        if (long_options[option_index].flag != 0)
        {
          break;
        }
        printf("option %s", long_options[option_index].name);

        if (optarg)
        {
          printf(" with arg %s", optarg);
        }
        printf("\n");
        break;

      case 'n':
        name = optarg;
        break;

      case '?':
        break;

      default:
        abort();
    }
  }

  std::cout << greet::greet(name) << std::endl;
}
