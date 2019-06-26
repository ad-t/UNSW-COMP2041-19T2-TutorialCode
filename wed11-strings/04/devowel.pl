#!/usr/bin/perl -w

while ($line = <>) {
  $line =~ s/[aeiou]//gi;
  print "$line";
}
