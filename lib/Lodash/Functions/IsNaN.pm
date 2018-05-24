package Lodash::Functions::IsNaN;
use strict;
use warnings;

use Lodash::Functions::IsNumber;

sub is_NaN {
    my $value = shift;
    Lodash::Functions::IsNumber::is_number($value) && $value != 0+$value
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::IsNaN - Checks if value is NaN

=head1 SYNOPSIS

    use POSIX qw(NaN);
    use Lodash::Functions::IsNaN;

    Lodash::Functions::IsNaN::is_NaN(NaN); # => 1

    Lodash::Functions::IsNaN::is_NaN(3);     # => 0
    Lodash::Functions::IsNaN::is_NaN(0);     # => 0
    Lodash::Functions::IsNaN::is_NaN('');    # => 0
    Lodash::Functions::IsNaN::is_NaN(undef); # => 0

=head1 DESCRIPTION

Returns true if value is NaN, else false.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#isNaN>
