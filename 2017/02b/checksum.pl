#!/usr/bin/env perl

use strict;
use warnings;
use Algorithm::Combinatorics qw(tuples);
use Scalar::Util::Numeric qw(isint);

my $checksum = 0;
while (<>) {
    my $iter = tuples([split(" ")], 2);
    while (my $pair = $iter->next) {
        my $quotient = $pair->[0]/$pair->[1];
        do {
            $checksum += $quotient;
            last;
        } if isint( $quotient );
    }
}
print "$checksum\n";
