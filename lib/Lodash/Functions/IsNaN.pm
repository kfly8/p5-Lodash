package Lodash::Functions::IsNaN;
use strict;
use warnings;

use Lodash::Functions::IsNumber;

sub is_NaN {
    my $value = shift;
    Lodash::Functions::IsNumber::is_number($value) && $value != 0+$value
}

1;
