package Lodash::Functions::Gt;
use strict;
use warnings;

use Lodash::JavaScript qw(is_string);
use Lodash::Functions::ToNumber;

sub gt {
    my ($a, $b) = @_;
    my $fg_a = is_string($a);
    my $fg_b = is_string($b);

    if ($fg_a && $fg_b) {
        return $a gt $b;
    }

    if ($fg_a || $fg_b) {
        $a = Lodash::Functions::ToNumber::to_number($a);
        $b = Lodash::Functions::ToNumber::to_number($b);
    }
    return $a > $b;
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Gt - Checks if value is greater than other

=head1 SYNOPSIS

    use Lodash::Functions::Gt;

    Lodash::Functions::Gt::gt(3, 1);   # => !!1;

    Lodash::Functions::Gt::gt(3, 3);   # => !!0;
    Lodash::Functions::Gt::gt(1, 3);   # => !!0;

=head1 DESCRIPTION

Returns true if value is greater than other, else false.

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#gt>
