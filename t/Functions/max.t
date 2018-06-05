use strict;
use warnings;
use Test::More;

use POSIX qw(NaN Inf);
use Lodash::Functions::Max;

is Lodash::Functions::Max::max([4, 2, 8, 6]), 8;
is Lodash::Functions::Max::max([]), undef;
is Lodash::Functions::Max::max(['a', 'b']), 'b';

is Lodash::Functions::Max::max([1, 'a']), 1;
is Lodash::Functions::Max::max(['a', 1]), 'a';

is Lodash::Functions::Max::max([NaN, 1]), 1;
is Lodash::Functions::Max::max([1, NaN]), 1;

is Lodash::Functions::Max::max([NaN, 'a']), 'a';
is Lodash::Functions::Max::max(['a', NaN]), 'a';

is Lodash::Functions::Max::max([1, NaN, Inf]), Inf;
is Lodash::Functions::Max::max(['a', 1, NaN, Inf]), 'a';

done_testing;
