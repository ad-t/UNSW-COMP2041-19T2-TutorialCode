#!/usr/bin/perl -w

use strict;

foreach my $url (@ARGV) {
  open my $URL_OUTPUT, "-|", "wget -q -O- $url" or die;

  while (my $line = <$URL_OUTPUT>) {
    my @possible_numbers = split /[^\d\- ]/, $line;

    foreach my $number (@possible_numbers) {
      $number =~ s/\D//g;
      print "$number\n" if length $number >= 8 && length $number <= 15;
    }
  }
}
