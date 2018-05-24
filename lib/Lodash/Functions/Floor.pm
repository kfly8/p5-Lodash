package Lodash::Functions::Floor;
use strict;
use warnings;

use Lodash::Internal::CreateRound;

sub floor;
*floor = create_round('floor');

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Floor - Computes number rounded down to precision.

=head1 SYNOPSIS

    use POSIX qw(NaN);
    use Lodash::Functions::Floor;

    Lodash::Functions::Floor::floor(4.006);    # => 4
    Lodash::Functions::Floor::floor(4.006, 0); # => 4
    Lodash::Functions::Floor::floor(4.016, 2); # => 4.01
    Lodash::Functions::Floor::floor(4.1, 2);   # => 4.1
    Lodash::Functions::Floor::floor(4160, -2); # => 4100

    # coerce `precision` to an integer'
    Lodash::Functions::Floor::floor(4.006, NaN);  # => 4
    Lodash::Functions::Floor::floor(4.016, 2.6);  # => 4.01
    Lodash::Functions::Floor::floor(4.016, '+2'); # => 4.01

    # exponential notation and `precision`
    Lodash::Functions::Floor::floor(5e1, 2);     # => 50
    Lodash::Functions::Floor::floor('5e', 1);    # => NaN
    Lodash::Functions::Floor::floor('5e1e1', 1); # => NaN

=head1 DESCRIPTION

Returns the rounded down number.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#floor>

