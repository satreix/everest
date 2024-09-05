#!/usr/bin/perl
use strict;
use warnings;

use Test::Simple tests => 2;

require 'hello_world.pl';

# Test 1: Default greeting
ok(greet('World') eq "Hello, World!\n", "Greeting with 'World' is correct");

# Test 2: Greeting with a specific name
ok(greet('Alice') eq "Hello, Alice!\n", "Greeting with 'Alice' is correct");
