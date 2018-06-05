use strict;
use warnings;
use Test::More;

use Lodash::Functions::Gt;

ok Lodash::Functions::Gt::gt(3, 1);
ok Lodash::Functions::Gt::gt('def', 'abc');

ok not Lodash::Functions::Gt::gt(1, 3);
ok not Lodash::Functions::Gt::gt(3, 3);
ok not Lodash::Functions::Gt::gt('abc', 'def');
ok not Lodash::Functions::Gt::gt('def', 'def');

done_testing;
