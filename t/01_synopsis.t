use strict;
use warnings;

use Test::More;
use Test::Synopsis::Expectation;

use File::Spec;
use Module::Find qw(findsubmod);

my @found = findsubmod Lodash::Functions;
for (@found) {
    subtest $_ => sub {
        synopsis_ok(_file($_));
    };
}

sub _file { File::Spec->catdir('lib', split /::/, $_[0] . '.pm') }

done_testing();
