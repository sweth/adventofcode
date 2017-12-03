#!/usr/bin/env perl

use strict;
use warnings;

while (<>) {
    my ($input, $expected) = /(\d+)(?:\s?#\s?)?(\d+)?/;
    my $ring = 0;
    while ((2*$ring+1)**2 < $input) {
        $ring++
    };
    my $ring_start_offset = $ring == 0 ? 0 : 2*$ring-1;
    my $ring_end = (2*$ring+1)**2;
    my $ring_end_offset = $ring == 0 ? 0 : 2*$ring;
    my $distance = $ring == 0 ? 0 : $ring_end_offset - ($ring_end - $input)%(2*$ring);

    print "Input:\t$input\n";
    print "Ring:\t$ring\n";
    print "Ring End:\t$ring_end\n";
    print "Ring End Offset:\t$ring_end_offset\n";
    print "Expected:\t$expected\n" if defined($expected);
    print "Calculated:\t$distance\n\n"; 
}
