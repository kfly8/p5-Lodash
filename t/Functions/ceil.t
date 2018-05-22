use strict;
use warnings;
use Test::More;

use POSIX qw(NaN);

use Lodash::Functions::Ceil;

is Lodash::Functions::Ceil::ceil(4.006), 5;
is Lodash::Functions::Ceil::ceil(4.006, 0), 5;
is Lodash::Functions::Ceil::ceil(4.016, 2), 4.02;
is Lodash::Functions::Ceil::ceil(4.1, 2), 4.1;
is Lodash::Functions::Ceil::ceil(4160, -2), 4200;

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
