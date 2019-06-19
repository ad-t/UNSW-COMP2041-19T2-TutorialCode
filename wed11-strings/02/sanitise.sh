#!/bin/sh

while read id mark extras
do
  case "$mark" in
    [0-9]*) ;;
    *) echo "$id ?? ($mark)"
      continue
      ;;
  esac

  if test $mark -lt 50
  then
    echo "$id FL"
  elif test $mark -lt 65
  then
    echo "$id PS"
  elif test $mark -lt 75
  then
    echo "$id CR"
  elif test $mark -lt 85
  then
    echo "$id DN"
  elif test $mark -lt 100
  then
    echo "$id HD"
  else
    echo "$id ?? ($mark)"
  fi
done
