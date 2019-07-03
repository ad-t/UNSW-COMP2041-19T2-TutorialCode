#!/usr/bin/perl -w

use strict;

our $n = shift @ARGV or die "Usage: $0 <n-lines>\n";

sub n_lines {
  my ($number_of_lines) = @_;

  my $text = "";
  $text .= <> foreach (1..$number_of_lines);
  return $text;
}

print n_lines($n);
