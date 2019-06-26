#!/usr/bin/perl -w 

$inverted = 0;
if ($ARGV[0] =~ /^-v$/) {
  $inverted = 1;
  shift @ARGV;
}

$expression = shift @ARGV;

$ARGV[0] = "-" if @ARGV == 0;

foreach $file (@ARGV) {
  open $input_file, "<$file" or die "cannot open $file\n";
  print "==> $file <==\n";
  @lines = <$input_file>;
  foreach $line (@lines) {
    if ($line =~ /$expression/) {
      # line matches
      if ($inverted == 0) {
        # prints only if the inversion flag is off
        print $line;
      }
    } else {
      if ($inverted == 1) {
        # prints only if the inversion flag is on 
        # and the expression does not match
        print $line;
      }
    }
  }

  close $input_file;
}
