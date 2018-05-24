use strict;
use warnings;
use Test::More;

use POSIX qw(NaN);
use Lodash::Functions::Divide;

subtest 'add two numbers' => sub {
    is Lodash::Functions::Divide::divide(6, 4), 1.5;
    is Lodash::Functions::Divide::divide(-6, 4), -1.5;
    is Lodash::Functions::Divide::divide(-6, -4), 1.5;
};

subtest 'not coerce arguments to numbers' => sub {
    is Lodash::Functions::Divide::divide('6', '4'), 1.5;
    is Lodash::Functions::Divide::divide('x', 'y'), NaN;
};

done_testing;
