package Lodash::Functions::Ceil;
use strict;
use warnings;

use POSIX ();

use Lodash::Internal::CreateRound;

sub ceil;
*ceil = create_round('ceil');

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Ceil - Computes `number` rounded up to `precision`.

=head1 SYNOPSIS

    use Test::More;

    use constant NaN => -sin(9**9**9);

    use Lodash::Functions::Ceil;

    is Lodash::Functions::Ceil::ceil(4.006), 5;
    is Lodash::Functions::Ceil::ceil(4.006, 0), 5;
    is Lodash::Functions::Ceil::ceil(4.016, 2), 4.01;
    is Lodash::Functions::Ceil::ceil(4.1, 2), 4.1;
    is Lodash::Functions::Ceil::ceil(4160, -2), 4100;

    subtest 'coerce `precision` to an integer' => sub {
        is Lodash::Functions::Ceil::ceil(4.006, NaN), 5;
        is Lodash::Functions::Ceil::ceil(4.016, 2.6), 4.02;
        is Lodash::Functions::Ceil::ceil(4.016, '+2'), 4.02;
    };

    subtest 'exponential notation and `precision`' => sub {
        is Lodash::Functions::Ceil::ceil(5e1, 2), 50;
        is Lodash::Functions::Ceil::ceil('5e', 1), NaN;
        is Lodash::Functions::Ceil::ceil('5e1e1', 1), NaN;
    };

    done_testing;

=head1 DESCRIPTION

Returns the rounded up number.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#ceil>

