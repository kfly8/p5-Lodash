use strict;
use warnings;
use Test::More;

use POSIX qw(Inf NaN);

use Lodash::Functions::IsNaN;
use Lodash qw(_);

ok Lodash::Functions::IsNaN::is_NaN(NaN);

ok not Lodash::Functions::IsNaN::is_NaN(3);
ok not Lodash::Functions::IsNaN::is_NaN(0);
ok not Lodash::Functions::IsNaN::is_NaN(Inf);
ok not Lodash::Functions::IsNaN::is_NaN([1,2,3]);
ok not Lodash::Functions::IsNaN::is_NaN(!!1);
ok not Lodash::Functions::IsNaN::is_NaN(!1);
ok not Lodash::Functions::IsNaN::is_NaN(\1);
ok not Lodash::Functions::IsNaN::is_NaN(!!0);
ok not Lodash::Functions::IsNaN::is_NaN(bless {}, 'Foo');
ok not Lodash::Functions::IsNaN::is_NaN(_);
ok not Lodash::Functions::IsNaN::is_NaN(sub {});
ok not Lodash::Functions::IsNaN::is_NaN(+{ a => 1});
ok not Lodash::Functions::IsNaN::is_NaN(qr/x/);
ok not Lodash::Functions::IsNaN::is_NaN('a');

done_testing;
