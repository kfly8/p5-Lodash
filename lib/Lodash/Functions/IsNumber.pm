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

    use Test::More;
    use Lodash::Functions::IsNumber;
    use POSIX qw(Inf NaN)

    ok Lodash::Functions::IsNumber::isNumber(3);
    ok Lodash::Functions::IsNumber::isNumber(Inf);
    ok Lodash::Functions::IsNumber::isNumber(NaN);

    ok not Lodash::Functions::IsNumber::isNumber('3');

    done_testing;

