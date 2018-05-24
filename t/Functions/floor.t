use strict;
use warnings;
use Test::More;

use POSIX qw(NaN);

use Lodash::Functions::Floor;

is Lodash::Functions::Floor::floor(4.006), 4;
is Lodash::Functions::Floor::floor(4.006, 0), 4;
is Lodash::Functions::Floor::floor(4.016, 2), 4.01;
is Lodash::Functions::Floor::floor(4.1, 2), 4.1;
is Lodash::Functions::Floor::floor(4160, -2), 4100;

subtest 'coerce `precision` to an integer' => sub {
    is Lodash::Functions::Floor::floor(4.006, NaN), 4;
    is Lodash::Functions::Floor::floor(4.016, 2.6), 4.01;
    is Lodash::Functions::Floor::floor(4.016, '+2'), 4.01;
};

subtest 'exponential notation and `precision`' => sub {
    is Lodash::Functions::Floor::floor(5e1, 2), 50;
    is Lodash::Functions::Floor::floor('5e', 1), NaN;
    is Lodash::Functions::Floor::floor('5e1e1', 1), NaN;
};

done_testing;
