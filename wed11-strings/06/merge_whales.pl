#!/usr/bin/perl -w

use strict;

die "Usage: $0 <whale_observations>" if $#ARGV + 1 != 1;

open my $FILE_HANDLE, "<", $ARGV[0] or die "Cannot open $ARGV[0]\n";

my $current_date = "";
my $current_count = 0;
my $current_species = "";
while (my $line = <$FILE_HANDLE>) {
  if ($line =~ /^(\S+)\s+(\d+)\s+(.+)\s*$/) {
    my $date = $1;
    my $count = $2;
    my $species = $3;
    if ($species eq $current_species && $date eq $current_date) {
      $current_count += $count;
    } else {
      print "$current_date $current_count $current_species\n" if $current_count;
      $current_date = $date;
      $current_count = $count;
      $current_species = $species;
    }
  }
}

print "$current_date $current_count $current_species\n" if $current_count;
