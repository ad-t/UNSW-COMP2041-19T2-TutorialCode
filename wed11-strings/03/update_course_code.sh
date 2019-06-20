#!/bin/sh -x

for arg in $@
do
  if test -d "$arg"
  then
    for subfile in `find "$arg" -type f`
    do
      cat "$subfile" | sed "s/COMP2041/COMP2042/" | sed "s/COMP9044/COMP9042/" > $subfile.$$
    done
  elif test -e "$arg"
  then
    cat "$arg" | sed "s/COMP2041/COMP2042/" | sed "s/COMP9044/COMP9042/" > $arg.$$
  fi
done
