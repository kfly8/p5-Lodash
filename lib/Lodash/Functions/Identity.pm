package Lodash::Functions::Identity;
use strict;
use warnings;

sub identity { $_[0] }

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Functions::Identity - return the first argument it receives

=head1 SYNOPSIS

    use Lodash::Functions::Identity;

    my $hash = { a => 1 };
    Lodash::Functions::Identity::identity($hash) == $hash; # => success

=head1 SEE ALSO

L<https://lodash.com/docs/4.17.10#identity>
