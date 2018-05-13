package Lodash::Functions::Add;
use v5.16.3;
use strict;
use warnings;
use parent qw(Exporter::Tiny);

our @EXPORT = qw(_add _add_);

sub _add {
    add(@_)
}

sub _add_ {
    \&_add
}

sub add {
    my ($augend, $addend) = @_;
    $augend + $addend
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Add - caption

=head1 SYNOPSIS

use Lodash::Functions::Add;

=head1 DESCRIPTION

Lodash::Functions::Add is description
