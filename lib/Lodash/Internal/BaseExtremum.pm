package Lodash::Internal::BaseExtremum;
use strict;
use warnings;

use parent qw(Exporter::Tiny);

our @EXPORT = qw(base_extremum);

use Lodash::JavaScript qw(is_string);

sub base_extremum {
    my ($array, $iteratee, $comparator) = @_;

    my $result;
    my $computed;
    for my $value (@$array) {
        my $current = $iteratee->($value);

        if (
            defined $current &&
            defined $computed
                ? $comparator->($current, $computed)
                : is_string($current) ? $current eq $current : $current == $current
        ) {
            $computed = $current;
            $result = $value;
        }
    }
    return $result;
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Internal::BaseExtremum - Returns the extremum value

=head1 DESCRIPTION

The base implementation of methods like `_.max` and `_.min` which accepts a
`comparator` to determine the extremum value.

=head1 SEE ALSO

https://github.com/lodash/lodash/blob/67389a8c78975d97505fa15aa79bec6397749807/lodash.js#L2867

