use strict;
use warnings;
use Test::More;

use Lodash::Functions::Identity;

subtest 'return the first argument given' => sub {
    my $hash = { name => 'fred' };
    is(Lodash::Functions::Identity::identity($hash), $hash);
};

done_testing;
