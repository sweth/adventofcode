#!/usr/bin/env perl

use strict;
use warnings;
use DDP;

while (<>) {
    my ($input, $expected) = /([^#]+)(?:\s?#\s?)?(\d+)?/;
    my @registers = split(' ', $input);
    my $maxRegisterIndex = $#registers;
    my %seen;
    my $count = 0;
    while (not $seen{join('.', @registers)}) {
        $seen{join('.', @registers)}=$count;
        $count++;
        do { print STDERR "\n$count:\n"; p(@registers); p(%seen);} if $ENV{'DEBUG'};
        my $indexOfFirstLargest = 0;
        $registers[$indexOfFirstLargest] > $registers[$_]
            or $indexOfFirstLargest = $_
            for reverse (0 .. $#registers);
        my $valueToDistribute = $registers[my $currentIndex = $indexOfFirstLargest];
        @registers[$indexOfFirstLargest] = 0;
        print STDERR "Reset Index $indexOfFirstLargest to $registers[$currentIndex]\n"
            if $ENV{'DEBUG'};
        for (1 .. $valueToDistribute) {
            $currentIndex = 0 if (++$currentIndex > $maxRegisterIndex);
            $registers[$currentIndex]++;
            print STDERR "Set Index $currentIndex to $registers[$currentIndex]\n"
                if $ENV{'DEBUG'};
        }
        p(@registers) if $ENV{'DEBUG'};
    }
    print "\nInput: $input\n";
    print "Expected: $expected\n" if defined ($expected);
    print "Calcuated: ", $count - $seen{join('.', @registers)}, "\n";
}
