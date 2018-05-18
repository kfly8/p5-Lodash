use strict;
use warnings;
use utf8;
use Test::More;

use Lodash::JavaScript qw(is_string);

my @ok_case = (
    'hello',
    '1',
    '',
);

my @ng_case = (
    0,
    1,
    0.1,
    9**9**9,
    -sin(9**9**9),
    [],
    {},
);

subtest 'is string' => sub {
    for (@ok_case) {
        ok is_string($_), "'$_' is string";
    }
};

subtest 'is NOT string' => sub {
    for (@ng_case) {
        ok !is_string($_), "$_ is NOT string";
    }
};

done_testing;
