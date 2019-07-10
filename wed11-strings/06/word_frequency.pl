#!/usr/bin/perl -w

use strict;

# empty dictionary
my %words = ();

# read from stdin
while (my $line = <>) {
  $line =~ tr/A-Z/a-z/;
  foreach my $word ($line =~ /[a-z]+/g) {
    $words{$word}++;
  }
}

my @words_keys = keys %words;
my @sorted_words = sort {$words{$b} <=> $words{$a}} @words_keys;

foreach my $word (@sorted_words) {
  printf "%d %s\n", $words{$word}, $word;
}
