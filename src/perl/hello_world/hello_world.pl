#!/usr/bin/perl
use strict;
use warnings;

use Getopt::Long;

sub greet {
    my ($name) = @_;
    return "Hello, $name!\n";
}

my $name = 'World';
GetOptions('name=s' => \$name);

print greet($name);
