#!/usr/bin/env perl

use strict;
use warnings;
use DDP;
use Algorithm::Combinatorics;
use Math::PlanePath::SquareSpiral;
my $path = Math::PlanePath::SquareSpiral->new;
my %step2value;
$step2value{1} = 1;

while (<>) {
    my ($input, $expected) = /(\d+)(?:\s?#\s?)?(\d+)?/;
    my $step = 1;
    while ($step++ < $input) {
        my ($x, $y) = $path->n_to_xy($step);
        $step2value{$step} ||= 0;
        if (not $step2value{$step}) {
            for my $x_boundary ($x-1 .. $x+1) {
                for my $y_boundary ($y-1 .. $y+1) {
                    my $step_neighbor_value =
                        $step2value{$path->xy_to_n($x_boundary, $y_boundary)} || 0;
                    if (
                        $step_neighbor_value > 0 and not
                        ($x == $x_boundary and $y == $y_boundary)
                    ) {
                        $step2value{$step} += $step_neighbor_value;
                    }
                };
            }
        }
    };

    print "Input:\t$input\n";
    print "Expected:\t$expected\n" if defined($expected);
    print "Calculated:\t$step2value{$input}\n\n"; 
}
