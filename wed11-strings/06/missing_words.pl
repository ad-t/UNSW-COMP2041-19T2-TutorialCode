#!/usr/bin/perl -w

use strict;

die "Usage: $0 <file 1> <file 2>" if $#ARGV != 1;

# get the file names
my $file1 = $ARGV[0];
my $file2 = $ARGV[1];

# hashes to track word occurrence
my %words = ();

# open both and determine which words have been added or deleted
open my $FILE_1_HANDLE, "<", $file1 or die "Can't open $file1\n";
while (my $line = <$FILE_1_HANDLE>) {
  chomp $line;
  my @split_words = split / /, $line;
  foreach my $word (@split_words) {
    $words{$word} = "added";
  }
}
close $FILE_1_HANDLE;

open my $FILE_2_HANDLE, "<", $file2 or die "Can't open $file2\n";
while (my $line = <$FILE_2_HANDLE>) {
  chomp $line;
  my @split_words = split / /, $line;
  foreach my $word (@split_words) {
    $words{$word} = "deleted";
  }
}
close $FILE_2_HANDLE;

# print the missing words to stdout
foreach my $word (sort keys %words) {
  print "$word\n" if $words{$word} ne "deleted";
}
