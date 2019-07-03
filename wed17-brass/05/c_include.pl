#!/usr/bin/perl -w

use strict;

our @include_dirs = ('/usr/include/', '/usr/local/include/', '/usr/include/x86_64-linux-gnu/');

sub include_file($@);

sub include_file($@) {
  my ($file, @prefixes) = @_;

  foreach my $prefix (@prefixes) {
    my $path = "$prefix$file";
    next if !-r $path;

    open my $file, "<", $path or die;

    while (my $line = <$file>) {
      if ($line =~ /^#\s*include\s*"(.*?)"/) {
        include_file($1, ('', @include_dirs));
      } elsif ($line =~ /^#\s*include\s*<(.*?)>/) {
        include_file($1, @include_dirs);
      } else {
        print $line;
      }
    }
  }
}

foreach my $file (@ARGV) {
  include_file($file, (''));
}
