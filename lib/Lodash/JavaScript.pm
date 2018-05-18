package Lodash::JavaScript;
use strict;
use warnings;
use utf8;
use parent qw(Exporter::Tiny);

our @EXPORT_OK = qw(is_number is_string is_array_ref);

use Scalar::Util ();
use Data::Util ();

sub is_number {
    Scalar::Util::looks_like_number($_[0]);
}

sub is_string {
    my $value = shift;
    if (Scalar::Util::looks_like_number($value)) {
        return ($value ^ $value) ne 0
    }
    elsif(Data::Util::is_string($value)) {
        return !!1
    }
    elsif($value eq '') {
        return !!1
    }
    return !!0
}

sub is_array_ref {
    Data::Util::is_array_ref($_[0]);
}

1;
__END__

=encoding utf-8

=head1 NAME

Lodash::JavaScript - caption

=head1 SYNOPSIS

use Lodash::JavaScript;

=head1 DESCRIPTION

Lodash::JavaScript is description
