#!/usr/bin/env perl

use strict;
use warnings;
use DDP;

while (<>) {
    chomp;
    my ($digits, $answer) = split(/ /);
    my $sum = 0;
    my @digits = split(//, $digits);
    my $max = $#digits;
    my $halfcount = scalar(@digits/2);
    push (@digits, @digits);
    for my $index (0..$max) {
        $sum+=$digits[$index] if $digits[$index] == $digits[$index+$halfcount];
    }
    print "Expected:\t$answer\n" if defined($answer);
    print "Calculated:\t$sum\n\n";
}
