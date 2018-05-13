package Lodash::Wrapper;
use strict;
use warnings;

sub new {
    my $class = shift;
    my $args = shift;
    bless {
        wrapped => $args,
        actions => [],
        chain   => 0,
        index   => 0,
        values  => undef,
    } => $class;
}

1;
