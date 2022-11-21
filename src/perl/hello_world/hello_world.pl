#!/usr/bin/perl
use warnings;

use Getopt::Long;

my $name = 'World';
GetOptions( 'name=s' => \$name );

print("Hello, $name!\n");
