use strict;
use warnings;
use Test::More;

use Lodash::Functions::Add;

subtest 'add two numbers' => sub {
    is Lodash::Functions::Add::add(6, 4), 10;
    is Lodash::Functions::Add::add(-6, 4), -2;
    is Lodash::Functions::Add::add(-6, -4), -10;
};

subtest 'not coerce arguments to numbers' => sub {
    is Lodash::Functions::Add::add('6', '4'), '64';
    is Lodash::Functions::Add::add('x', 'y'), 'xy';
};

done_testing;
