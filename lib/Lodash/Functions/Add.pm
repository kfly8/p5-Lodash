package Lodash::Functions::Add;
use strict;
use warnings;

use Lodash::Internal::CreateMathOperation;

sub add;
*add = create_math_operation(
    default_value => 0,
    number => sub {
        my ($augend, $addend) = @_;
        $augend + $addend
    },
    string => sub {
        my ($augend, $addend) = @_;
        $augend . $addend
    },
);

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Add - Adds two numbers

=head1 SYNOPSIS

    use Lodash::Functions::Add;

    # add two numbers
    Lodash::Functions::Add::add(6, 4);   # => 10;
    Lodash::Functions::Add::add(-6, 4);  # => -2;
    Lodash::Functions::Add::add(-6, -4); # => -10;

    # concat two strings
    Lodash::Functions::Add::add('6', '4'); # => '64';
    Lodash::Functions::Add::add('x', 'y'); # => 'xy';

=head1 DESCRIPTION

Return the total value from the two numbers

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#add>
