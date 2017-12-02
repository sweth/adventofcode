#!/usr/bin/env perl

use strict;
use warnings;
use DDP;

while (<>) {
    chomp;
    my ($digits, $answer) = split(/ /);
    my $sum = 0;
    my @digits = split(//, $digits);
    for my $index (0..$#digits) {
        my $nextindex = ($index == $#digits) ? 0 : $index+1;
        $sum+=$digits[$index] if $digits[$index] == $digits[$nextindex];
    }
    print "Expected:\t$answer\n" if defined($answer);
    print "Calculated:\t$sum\n\n";
}
