#!/usr/bin/env perl

use strict;
use warnings;
use DDP;

chomp(my @instructions = <>);
my $jumpcount = 0;
my $pos = 0;
my $exit = scalar(@instructions);
while ($pos < $exit) {
    $pos += $instructions[$pos]++;
    $jumpcount++;
}
print "$jumpcount\n";
