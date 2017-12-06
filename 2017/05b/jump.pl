#!/usr/bin/env perl

use strict;
use warnings;

chomp(my @instructions = <>);
my $jumpcount = 0;
my $pos = 0;
my $exit = scalar(@instructions);
while ($pos < $exit) {
    $pos += my $offset = $instructions[my $oldpos = $pos];
    ($instructions[$oldpos] >= 3) ?
        $instructions[$oldpos]-- :
        $instructions[$oldpos]++;
    $jumpcount++;
}
print "$jumpcount\n";
