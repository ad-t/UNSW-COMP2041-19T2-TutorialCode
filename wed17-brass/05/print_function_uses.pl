#!/usr/bin/perl -w

use strict;

my $function_name = $ARGV[0] or die "Usage: $0 <function-name>\n";

foreach my $c_file (glob("*.c")) {
  open my $file_handle, "<", $c_file or die "Can't open $c_file\n";

  while (my $line = <$file_handle>) {
    $line =~ s/\/\/.*//g;
    $line =~ s/\/\*.*?\*\///g;
    # /* abc */ some code here /* bcd */
    $line =~ s/".*?"//g;

    $line =~ /\b$function_name\s*\(/ or next;
    print "$c_file:$. function $function_name ";

    if ($line =~ /^\s/) {
      print "used\n";
    } elsif ($line =~ /;/) {
      print "declared\n";
    } else {
      print "defined\n";
    }
  }

  close $file_handle;
}
