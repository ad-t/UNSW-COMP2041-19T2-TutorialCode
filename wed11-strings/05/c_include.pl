#!/usr/bin/perl -w

use strict;

sub include_file($);

sub include_file {
  my ($file) = @_;

  open my FILE, "<", $file or die "$0: can not open $file: $1\n";
  while (my $line = <FILE>) {
    if ($line =~ /^#\s*include\s*"([^']*)"/) {
      include_file($1);
    } else {
      print $line;
    }
  }
}

foreach my $file (@ARGV) {
  include_file($file);
}
