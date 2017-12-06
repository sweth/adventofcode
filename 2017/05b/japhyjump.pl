#!/usr/bin/env perl

# a slightly faster and japhier approach
# (speed change of note is mostly due to skipping chomp)

use strict;
use warnings;

my $exit = scalar(my @instructions = <>);
my ($jumpcount, $pos) = (0) x 2;
while ($pos < $exit && ++$jumpcount) {
    $pos += $instructions[my $oldpos = $pos];
    $instructions[$oldpos] += $instructions[$oldpos] >= 3 ? -1 : 1;
}
print "$jumpcount\n";
