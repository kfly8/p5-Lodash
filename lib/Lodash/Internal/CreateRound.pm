package Lodash::Internal::CreateRound;
use strict;
use warnings;

use parent qw(Exporter::Tiny);

our @EXPORT = qw(create_round);

use POSIX;
use List::Util ();
use Lodash::Functions::ToNumber;
use Lodash::Functions::IsNaN;

use constant MIN_PRECISION => 292;

sub create_round {
    my $method_name = shift;
    my $func = POSIX->can($method_name);
    return sub {
        my ($number, $precision) = @_;
        $number = Lodash::Functions::ToNumber::to_number($number);
        return $number if Lodash::Functions::IsNaN::is_NaN($number);

        $precision = defined $precision ? List::Util::min(int($precision), MIN_PRECISION) : 0;
        if ($precision <=> 0) {
            my @pair = split 'e', "${number}e";
            my $value = $func->("$pair[0]e@{[$pair[1]//0 + $precision]}");
            @pair = split 'e', "${value}e";
            return 0+"$pair[0]e@{[$pair[1]//0 - $precision]}"
        }
        return $func->($number);
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

