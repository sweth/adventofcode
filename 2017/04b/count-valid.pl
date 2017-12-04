#!/usr/bin/env perl

use strict;
use warnings;
use DDP;

my $count=0;

while (<>) {
    my %words;
    $words{$_}++ for map { join ('' => sort split('')) } (split(" "));
    $count++ unless grep { $_ > 1 } values %words;
}

print "$count\n";
