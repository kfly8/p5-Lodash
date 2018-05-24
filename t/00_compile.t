use strict;
use warnings;
use Test::More;

use Module::Find qw(findallmod);
my @found = findallmod Lodash;

use_ok $_ for @found;

done_testing;

