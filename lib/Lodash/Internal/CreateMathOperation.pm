package Lodash::Internal::CreateMathOperation;
use strict;
use warnings;

use parent qw(Exporter::Tiny);

our @EXPORT = qw(create_math_operation);

use Lodash::JavaScript qw(is_string);
use Lodash::Internal::BaseToNumber;
use Lodash::Internal::BaseToString;

sub create_math_operation {
    my %args = @_;

    return sub {
        my ($value, $other) = @_;
        if (!defined $value && !defined $other) {
            return $args{default_value}
        }
        if (defined $value && !defined $other) {
            return $value
        }
        if (!defined $value && defined $other) {
            return $other
        }

        if (is_string($value) || is_string($other)) {
            $value = base_to_string($value);
            $other = base_to_string($other);

            return $args{string}->($value, $other);
        }
        else {
            $value = base_to_number($value);
            $other = base_to_number($other);

            return $args{number}->($value, $other);
        }
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Internal::CreateMathOperation - Creates a function that performs a mathematical operation on two values

=head1 SYNOPSIS

    use Lodash::Internal::CreateMathOperation;

    create_math_operation(
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
    # => coderef

