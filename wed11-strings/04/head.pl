#!/usr/bin/perl -w

$n_lines = 10;

if (@ARGV && $ARGV[0] =~ /-[0-9]+/) {
  $n_lines = $ARGV[0];
  $n_lines =~ s/-//;
  shift @ARGV;
}

# default to standard input if given no files
$ARGV[0] = "-" if @ARGV == 0;

foreach $file (@ARGV) {
  open my $input_file, "<$file" or die "$file: can't open: $!\n";
  print "==> $file <==\n";
  @lines = <$input_file>;
  $lines_to_print = 0;
  if ($#lines < $n_lines - 1) {
    $lines_to_print = $#lines;
  } else {
    $lines_to_print = $n_lines - 1;
  }
  print @lines[0..$lines_to_print];
  close $input_file;
}
