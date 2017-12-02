#!/usr/bin/env perl

use strict;
use warnings;
use List::AllUtils qw(min max);

my $checksum = 0;
while (<>) {
    my @fields = split(" ");
    $checksum += (max(@fields) - min(@fields));
}
print "$checksum\n";
