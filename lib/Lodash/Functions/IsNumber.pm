package Lodash::Functions::IsNumber;
use strict;
use warnings;

use Lodash::JavaScript ();

sub is_number;
*is_number = \&Lodash::JavaScript::is_number;

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::IsNumber - Returns `true` if `value` is a number, else `false`.

=head1 SYNOPSIS

    use POSIX qw(NaN Inf);
    use Lodash::Functions::IsNumber;

    Lodash::Functions::IsNumber::is_number(3);   # => 1
    Lodash::Functions::IsNumber::is_number(0);   # => 1
    Lodash::Functions::IsNumber::is_number(NaN); # => 1
    Lodash::Functions::IsNumber::is_number(Inf); # => 1

    Lodash::Functions::IsNumber::is_number('0');        # => 0
    Lodash::Functions::IsNumber::is_number('3');        # => 0
    Lodash::Functions::IsNumber::is_number('NaN');      # => 0
    Lodash::Functions::IsNumber::is_number('Inf');      # => 0
    Lodash::Functions::IsNumber::is_number('Infinity'); # => 0

=head1 DESCRIPTION

Checks if value is classified as a Number primitive or object.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#isNumber>

