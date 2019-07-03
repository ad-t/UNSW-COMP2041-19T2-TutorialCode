#!/usr/bin/perl -w

use strict;

foreach my $c_file (@ARGV) {
  open my $file_handle, "<", $c_file or die;

  while (my $line = <$file_handle>) {
    $line =~ /^([a-zA-Z_].*)\((.*)\)/ or next;
    my $function_start = $1;
    my $parameter = $2;
    my $function_type = $function_start;
    $function_type =~ s/\s*([a-zA-Z_]\w*)\s*$// or next;
    my $function_name = $1;

    my $parameter_type = $parameter;
    $parameter_type =~ s/\s*([a-zA-Z_]\w*)\s*$// or next;
    my $parameter_name = $1;

    print "function type='$function_type'\n";
    print "function name='$function_name'\n";
    print "parameter type='$parameter_type'\n";
    print "parameter name='$parameter_name'\n";
  }

  close $file_handle;
}
