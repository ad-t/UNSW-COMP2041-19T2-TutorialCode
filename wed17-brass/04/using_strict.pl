#!/usr/bin/perl -w

use strict;

our $var = 10;
add();
print $var, "\n";

sub add {
  print $var;
}
