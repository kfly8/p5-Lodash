package Lodash::Util;
use strict;
use warnings;

use parent qw(Exporter::Tiny);

our @EXPORT_OK = qw(guess_func_name_by_module);

use String::CamelCase ();

our $FUNC_NAME_EXCEPTION = {
    'Lodash::Functions::IsNaN' => 'is_NaN'
};

sub guess_func_name_by_module {
    my $module = shift;

    $FUNC_NAME_EXCEPTION->{$module} // do {
        my ($method) = String::CamelCase::decamelize($module =~ m!::([^:]+)$!);
        $method;
    }
}

1;
