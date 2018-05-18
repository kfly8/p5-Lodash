package Lodash::Object;
use strict;
use warnings;

use Carp qw();
use Module::Find qw();
use String::CamelCase qw();

{
    my @modules = Module::Find::usesub Lodash::Functions;
    for my $module (@modules) {
        my $method = String::CamelCase::decamelize($module =~ m!::([^:]+)$!);

        no strict qw/refs/;
        my $fun = "${module}::${method}";
        *{"@{[__PACKAGE__]}::${method}"} = sub {
            shift; # not use $class
            $fun->(@_);
        }
    }
}

sub new {
    my $class = shift;
    bless {} => $class;
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::Object - caption

=head1 SYNOPSIS

use Lodash::Object;

=head1 DESCRIPTION

Lodash::Object is description
