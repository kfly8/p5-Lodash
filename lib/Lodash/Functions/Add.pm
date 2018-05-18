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

    use Test::More;

    use Lodash::Functions::Add;

    subtest 'add two numbers' => sub {
        is Lodash::Functions::Add::add(6, 4), 10;
        is Lodash::Functions::Add::add(-6, 4), -2;
        is Lodash::Functions::Add::add(-6, -4), -10;
    };

    subtest 'not coerce arguments to numbers' => sub {
        is Lodash::Functions::Add::add('6', '4'), '64';
        is Lodash::Functions::Add::add('x', 'y'), 'xy';
    };

    done_testing;

=head1 DESCRIPTION

Return the total value from the two numbers

=head1 SEE ALSO

L<https://github.com/lodash/lodash/blob/master/add.js>
