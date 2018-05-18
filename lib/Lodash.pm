package Lodash;
use 5.008001;
use strict;
use warnings;
use parent qw(Exporter::Tiny);

use String::CamelCase qw();
use Module::Find qw();

use Lodash::Object;
use Lodash::Wrapper;

our $VERSION = "0.01";

our @EXPORT = qw(_);

our %EXPORT_TAGS = (
    core  => [qw(_)],
    math  => [qw(_add)],
    all   => [qw(:core :math)],
);

our @EXPORT_OK;
{
    my @modules = Module::Find::usesub Lodash::Functions;
    for my $module (@modules) {
        my ($method) = String::CamelCase::decamelize($module =~ m!::([^:]+)$!);

        no strict qw/refs/;
        my $fun  = "${module}::${method}";
        my $name = "_${method}";
        *{$name} = \&$fun;

        push @EXPORT_OK => $name;
    }
}

# generate `_`
sub _generate__ {

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

