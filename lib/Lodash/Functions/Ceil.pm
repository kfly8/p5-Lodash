package Lodash::Functions::Ceil;
use strict;
use warnings;

use Lodash::Internal::CreateRound;

sub ceil;
*ceil = create_round('ceil');

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Ceil - Computes `number` rounded up to `precision`.

=head1 SYNOPSIS

    use POSIX qw(NaN);
    use Lodash::Functions::Ceil;

    Lodash::Functions::Ceil::ceil(4.006);    # => 5
    Lodash::Functions::Ceil::ceil(4.006, 0); # => 5
    Lodash::Functions::Ceil::ceil(4.016, 2); # => 4.02
    Lodash::Functions::Ceil::ceil(4.1, 2);   # => 4.1
    Lodash::Functions::Ceil::ceil(4160, -2); # => 4200

    # coerce `precision` to an integer'
    Lodash::Functions::Ceil::ceil(4.006, NaN);  # => 5
    Lodash::Functions::Ceil::ceil(4.016, 2.6);  # => 4.02
    Lodash::Functions::Ceil::ceil(4.016, '+2'); # => 4.02

    # exponential notation and `precision`
    Lodash::Functions::Ceil::ceil(5e1, 2);     # => 50
    Lodash::Functions::Ceil::ceil('5e', 1);    # => NaN
    Lodash::Functions::Ceil::ceil('5e1e1', 1); # => NaN

=head1 DESCRIPTION

Returns the rounded up number.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#ceil>

