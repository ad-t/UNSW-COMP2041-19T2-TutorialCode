#!/usr/bin/perl -w

$invert_selection = 0;

if ($ARGV[0] =~ /^-v$/) {
  $invert_selection = 1;
  shift @ARGV;
}
$expression = shift @ARGV;

$ARGV[0] = "-" if @ARGV == 0;

foreach $file (@ARGV) {
  open my $input_file, "<$file" or die "Couldn't open: $file\n";
  @lines = <$input_file>;
  print "==> $file <==\n";
  foreach $line (@lines) {
    if ($line =~ /$expression/) {
      if ($invert_selection == 0) {
        print $line;
      }
    } else {
      if ($invert_selection == 1) {
        print $line;
      }
    }
  }
}
