#!/usr/bin/perl -w

$n_lines = 10;
if ($ARGV[0] =~ /-[0-9]+/) {
  $n_lines = shift @ARGV;
  $n_lines =~ s/-//g;
}

# default to using standard input if not given any additional files
$ARGV[0] = "-" if @ARGV == 0;

foreach $file (@ARGV) {
  open my $input_file, "<$file" or die "$file: can't open: $!\n";
  print "==> $file <==\n";
  @lines = <$input_file>;
  if ($#lines < $n_lines - 1) {
    $n_lines = $#lines;
  }
  print @lines[0..$n_lines-1];
  close $input_file;
}
