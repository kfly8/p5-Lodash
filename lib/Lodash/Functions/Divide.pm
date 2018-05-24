package Lodash::Functions::Divide;
use strict;
use warnings;

use Lodash::Internal::CreateMathOperation;
use Lodash::Functions::ToNumber;

sub divide;
*divide = create_math_operation(
    default_value => 0,
    number => sub {
        my ($augend, $addend) = @_;
        $augend / $addend
    },
    string => sub {
        my ($augend, $addend) = @_;
        $augend = Lodash::Functions::ToNumber::to_number($augend);
        $addend = Lodash::Functions::ToNumber::to_number($addend);
        $augend / $addend
    },
);

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Divide - Divide two numbers

=head1 SYNOPSIS

    use POSIX qw(NaN);
    use Lodash::Functions::Divide;

    Lodash::Functions::Divide::divide(6, 4);   # => 1.5
    Lodash::Functions::Divide::divide(-6, 4);  # => -1.5;
    Lodash::Functions::Divide::divide(-6, -4); # => 1.5;

    Lodash::Functions::Divide::divide('6', '4'); # => 1.5;
    Lodash::Functions::Divide::divide('x', 'y'); # => NaN;

=head1 DESCRIPTION

Return the total value from the two numbers

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#divide>
