use strict;
use warnings;
use Test::More;

use POSIX qw(Inf NaN);

use Lodash::Functions::ToNumber;

subtest 'should convert number primitives to numbers' => sub {
    is Lodash::Functions::ToNumber::to_number(10), 10;
    is Lodash::Functions::ToNumber::to_number(1_000), 1000;
    is Lodash::Functions::ToNumber::to_number(1.234567890), 1.23456789;
    is Lodash::Functions::ToNumber::to_number(5e2), 500;
    is Lodash::Functions::ToNumber::to_number(1e+308), 1e+308;
    is Lodash::Functions::ToNumber::to_number(1e308), 1e308;
    is Lodash::Functions::ToNumber::to_number(1E+308), 1E+308;
    is Lodash::Functions::ToNumber::to_number(1E308), 1E308;
    is Lodash::Functions::ToNumber::to_number(5e-324), 5e-324;
    is Lodash::Functions::ToNumber::to_number(NaN), NaN;
    is Lodash::Functions::ToNumber::to_number(Inf), Inf;
};

subtest 'should convert objects to numbers' => sub {
    is Lodash::Functions::ToNumber::to_number([]), 0;
    is Lodash::Functions::ToNumber::to_number([2]), 2;
    is Lodash::Functions::ToNumber::to_number([0, 0]), NaN;
    is Lodash::Functions::ToNumber::to_number([2,3]), NaN;
    is Lodash::Functions::ToNumber::to_number({}), NaN;
    is Lodash::Functions::ToNumber::to_number({ key => 'value' }), NaN;
    is Lodash::Functions::ToNumber::to_number(bless {}, 'Foo'), NaN;

    package Bar {
        sub new { bless {}, $_[0] }
        use overload (
            '""' => sub { '123' },
            fallback => 1,
        );
    }
    is Lodash::Functions::ToNumber::to_number(Bar->new), 123;
};

subtest 'should convert binary/octal strings to numbers' => sub {
    is Lodash::Functions::ToNumber::to_number('10'), 10;
    is Lodash::Functions::ToNumber::to_number('1_000'), 1000;
    is Lodash::Functions::ToNumber::to_number('1.234567890'), 1.23456789;
    is Lodash::Functions::ToNumber::to_number('5e2'), 500;
    is Lodash::Functions::ToNumber::to_number('1e+308'), 1e+308;
    is Lodash::Functions::ToNumber::to_number('1e308'), 1e308;
    is Lodash::Functions::ToNumber::to_number('1E+308'), 1E+308;
    is Lodash::Functions::ToNumber::to_number('1E308'), 1E308;
    is Lodash::Functions::ToNumber::to_number('5e-324'), 5e-324;
    is Lodash::Functions::ToNumber::to_number('NaN'), NaN;
    is Lodash::Functions::ToNumber::to_number('Inf'), Inf;
    is Lodash::Functions::ToNumber::to_number('Infinity'), Inf;
    is Lodash::Functions::ToNumber::to_number('0b10'), 2;
    is Lodash::Functions::ToNumber::to_number('070'), 56;
    is Lodash::Functions::ToNumber::to_number('0xff'), 255;
};

subtest 'should convert invalid binary/octal strings to NaN' => sub {
    is Lodash::Functions::ToNumber::to_number('5e'), NaN;
    is Lodash::Functions::ToNumber::to_number('NaNfoo'), NaN;
    is Lodash::Functions::ToNumber::to_number('fooNaN'), NaN;
    is Lodash::Functions::ToNumber::to_number('Inffoo'), NaN;
    is Lodash::Functions::ToNumber::to_number('0b02'), NaN;
    is Lodash::Functions::ToNumber::to_number('080'), NaN;
    is Lodash::Functions::ToNumber::to_number('0xfg'), NaN;
};

done_testing;
