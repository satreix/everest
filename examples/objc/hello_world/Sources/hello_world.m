#import <Foundation/Foundation.h>
#import "examples/objc/hello_world/Sources/Hello/hello.h"

int main(int argc, const char *argv[])
{
  NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];

  [standardDefaults setObject: @"World" forKey: @"name"];

  NSString *name = [standardDefaults stringForKey: @"name"];
  hello(name);
}
