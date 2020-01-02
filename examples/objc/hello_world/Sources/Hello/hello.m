#import <Foundation/Foundation.h>

void hello(NSString *name) {
  printf("Hello, %s!\n", [name UTF8String]);
}
