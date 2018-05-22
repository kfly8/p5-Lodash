package Lodash::Functions::ToNumber;
use strict;
use warnings;

use POSIX qw(NaN Inf);
use Lodash::JavaScript qw(is_number is_string);
use Data::Util qw(is_array_ref);

my $re_trim       = qr/^\s+|\s+$/;
my $re_is_hex     = qr/^0x[_0-9a-f]+$/io;
my $re_is_binary  = qr/^0b[_01]+$/io;
my $re_is_octal   = qr/^0[_0-7]+$/io;
my $re_is_inf     = qr/^(?:Inf|Infinity)$/io;

# TODO: REFACTOR remove `re_is_illegal` case
my $re_is_ten     = qr/^[+-]?(?=[0-9]|\.[0-9])[_0-9]*(?:\.[_0-9]*)?(?:[Ee][+-]?[_0-9]+)?$/o;
my $re_is_illegal = qr/^[+-]?0[_0-9]*(?:\.[_0-9]*)?(?:[Ee][+-]?[_0-9]+)?$/o;

sub to_number {
    my $value = shift;
    if (is_number($value)) {
        return $value
    }

    $value = is_array_ref($value) ? "@{$value}" ||0 : "$value";

    if (!is_string($value)) {
        return $value == 0 ? $value : 0+$value;
    }

    $value =~ s/$re_trim//g;

    return $value =~ $re_is_binary ? oct $value
         : $value =~ $re_is_octal  ? oct $value
         : $value =~ $re_is_hex    ? hex $value
         : $value =~ $re_is_illegal? NaN
         : $value =~ $re_is_ten    ? do { $value =~ s/_//g; 0+$value }
         : $value =~ $re_is_inf    ? Inf
         : NaN;
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::ToNumber - caption

=head1 SYNOPSIS

use Lodash::Functions::ToNumber;

=head1 DESCRIPTION

Lodash::Functions::ToNumber is description
