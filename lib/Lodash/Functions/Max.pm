package Lodash::Functions::Max;
use strict;
use warnings;

use Lodash::Functions::Identity;
use Lodash::Functions::Gt;

use Lodash::Internal::BaseExtremum;

sub max {
    my $array = shift;

    return $array && scalar @$array ?
        base_extremum(
            $array,
            \&Lodash::Functions::Identity::identity,
            \&Lodash::Functions::Gt::gt,
        ) : undef;
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Max - Computes the maximum value of array.

=head1 SYNOPSIS

    use POSIX qw(NaN Inf);
    use Lodash::Functions::Max;

    Lodash::Functions::Max::max([4, 2, 8, 6]); # => 8
    Lodash::Functions::Max::max([]);           # => undef
    Lodash::Functions::Max::max(['a', 'b']);   # => 'b'

    Lodash::Functions::Max::max([1, 'a']);     # => 1
    Lodash::Functions::Max::max(['a', 1]);     # => 'a'

    Lodash::Functions::Max::max([NaN, 1]);     # => 1;
    Lodash::Functions::Max::max([1, NaN]);     # => 1;

    Lodash::Functions::Max::max([NaN, 'a']);   # => 'a';
    Lodash::Functions::Max::max(['a', NaN]);   # => 'a';

    Lodash::Functions::Max::max([1, NaN, Inf]);      # => Inf;
    Lodash::Functions::Max::max(['a', 1, NaN, Inf]); # => 'a';

=head1 DESCRIPTION

Computes the maximum value of array. If array is empty or falsey, undefined is returned.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#max>

