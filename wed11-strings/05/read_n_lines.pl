#!/usr/bin/perl -w

use strict;

my $n = shift @ARGV or die "Usage: $0 <n-lines>\n";

sub n_lines {

  my ($number_lines) = @_;
  my $text = "";
  $text .= <> foreach (1..$number_lines);
  return $text;
}

print n_lines($n);
