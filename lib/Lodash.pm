package Lodash;
use 5.008001;
use strict;
use warnings;
use parent qw(Exporter::Tiny);

use Module::Find qw();
use Lodash::Object;
use Lodash::Wrapper;

our $VERSION = "0.01";

our @EXPORT = qw(_);

our %EXPORT_TAGS = (
    core  => [qw(_)],
    math  => [qw(_add _add_)],
    all   => [qw(:core :math)],
);

{
    my @modules = Module::Find::usesub Lodash::Functions;
    $_->import for @modules;

    our @EXPORT_OK = (
        map {
            my $src = sprintf('@%s::EXPORT', $_);
            eval $src ## no critic
        } @modules
    );
}

# generate `_`
sub _generate__ {
    my ($class, $name, $value, $globals) = @_;

    my $object = Lodash::Object->new;
    sub {
        return $object unless @_;
        return Lodash::Wrapper->new(@_);
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash - It's new $module

=head1 SYNOPSIS

    use Lodash;

=head1 DESCRIPTION

Lodash is ...

=head1 LICENSE

Copyright (C) Kenta, Kobayashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Kenta, Kobayashi E<lt>kentafly88@gmail.comE<gt>

