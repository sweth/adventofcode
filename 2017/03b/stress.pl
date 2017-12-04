#!/usr/bin/env perl

use strict;
use warnings;
use DDP;
use Algorithm::Combinatorics;
use Math::PlanePath::SquareSpiral;
my $path = Math::PlanePath::SquareSpiral->new;
my %square2value;
$square2value{1} = 1;
my $square = 1;

my $target = 347991;

SQUARE: while (($square2value{$square} ||= 0) < $target ) {
    my ($x, $y) = $path->n_to_xy($square);
    if (not $square2value{$square}) {
        for my $x_boundary ($x-1 .. $x+1) {
            for my $y_boundary ($y-1 .. $y+1) {
                my $square_neighbor_value =
                    $square2value{$path->xy_to_n($x_boundary, $y_boundary)} || 0;
                if (
                    $square_neighbor_value > 0 and not
                    ($x == $x_boundary and $y == $y_boundary)
                ) {
                    $square2value{$square} += $square_neighbor_value;
                }
            };
        }
    }
    if ($square2value{$square} > $target) {
        last SQUARE;
    } else {
        $square++
    };
};
print "$square: $square2value{$square}\n";
