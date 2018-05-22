package Lodash::Internal::BaseToString;
use strict;
use warnings;
use utf8;

use parent qw(Exporter::Tiny);

our @EXPORT = qw(base_to_string);

use Lodash::JavaScript qw(is_string is_array);

sub base_to_string {
    my $value = shift;
    if (is_string($value)) {
        return $value;
    }
    if (is_array($value)) {
        return "@$value";
    }

    "$value";
    # no case: `value = -0` 
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
