#!/usr/bin/perl -w

use strict;

our @include_dir = ('/usr/include/', '/usr/local/include/', '/usr/include/x86_64-linux-gnu/');

sub include_file($@);

sub include_file($@) {
  my ($file, @prefixes) = @_;

  foreach my $prefix (@prefixes) {
    my $path = "$prefix$file";
    next if !-r $path;
    open my $FILE, "<", $path or die "$0: cannot open $path: $!\n";
    while (my $line = <$FILE>) {
      if ($line =~ /^#\s*include\s*"(.*?)"/) {
        include_file($1, (''));
      } elsif ($line =~ /^#\s*include\s*<(.*?)>/) {
        include_file($1, @include_dir);
      } else {
        print $line;
      }
    }
    close $FILE;
  }
}

foreach my $file (@ARGV) {
  include_file($file, (''));
}
