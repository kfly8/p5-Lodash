use strict;
use warnings;
use Test::More;

use POSIX qw(Inf NaN);

use Lodash::Functions::IsNumber;
use Lodash qw(_);

ok Lodash::Functions::IsNumber::is_number(3);
ok Lodash::Functions::IsNumber::is_number(0);
ok Lodash::Functions::IsNumber::is_number(NaN);
ok Lodash::Functions::IsNumber::is_number(Inf);

ok not Lodash::Functions::IsNumber::is_number('0');
ok not Lodash::Functions::IsNumber::is_number('3');
ok not Lodash::Functions::IsNumber::is_number('NaN');
ok not Lodash::Functions::IsNumber::is_number('Inf');
ok not Lodash::Functions::IsNumber::is_number('Infinity');
ok not Lodash::Functions::IsNumber::is_number([1,2,3]);
ok not Lodash::Functions::IsNumber::is_number(!!1);
ok not Lodash::Functions::IsNumber::is_number(!1);
ok not Lodash::Functions::IsNumber::is_number(\1);
ok not Lodash::Functions::IsNumber::is_number(!!0);
ok not Lodash::Functions::IsNumber::is_number(bless {}, 'Foo');
ok not Lodash::Functions::IsNumber::is_number(_);
ok not Lodash::Functions::IsNumber::is_number(sub {});
ok not Lodash::Functions::IsNumber::is_number(+{ a => 1});
ok not Lodash::Functions::IsNumber::is_number(qr/x/);
ok not Lodash::Functions::IsNumber::is_number('a');

done_testing;
