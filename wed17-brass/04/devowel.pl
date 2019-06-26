#!/usr/bin/perl -w

$filtered = "";

while ($line = <STDIN>) {
  $line =~ s/[aeiou]//gi;
  $filtered .= $line;
}

print $filtered;
