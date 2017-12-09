#!/usr/bin/env perl

use strict;
use warnings;
use DDP;
use Graph::Directed;

my $graph = Graph::Directed->new;

while (<>) {
    my @branches;
    my ($root, $weight, $branches) =
        m/^(\w+)\s*\((\d+)\)(?:\s*->\s*(.*))?$/;
    if (defined $branches) {
        for my $dest (split(', ' => $branches)) {
            $graph->add_edge( $root => $dest );
        } 
    }
}
print "Root: ", ($graph->topological_sort)[0], "\n";
