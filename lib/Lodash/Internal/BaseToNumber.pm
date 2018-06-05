package Lodash::Internal::BaseToNumber;
use strict;
use warnings;

use parent qw(Exporter::Tiny);

our @EXPORT = qw(base_to_number);

use Lodash::JavaScript qw(is_number);

sub base_to_number {
    my $value = shift;
    if (is_number($value)) {
        return $value;
    }
    return 0+$value;
}


1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Internal::BaseToNumber - caption

=head1 SYNOPSIS

    use Lodash::Internal::BaseToNumber;

    base_to_number(1); # => 1
    base_to_number('1'); # => 1

=head1 DESCRIPTION

The base implementation of `toNumber` which doesn't ensure correct
conversions of binary, hexadecimal, or octal string values.
