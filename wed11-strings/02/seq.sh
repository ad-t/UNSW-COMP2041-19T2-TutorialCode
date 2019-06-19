#!/bin/sh

if test $# = 1
then
  first=1
  increment=1
  last=$1
elif test $# = 2
then
  first=$1
  increment=1
  last=$2
elif test $# = 3
then
  first=$1
  increment=$2
  last=$3
else
  cat << EOF
Usage:
  $0 last (prints numbers in range 1..last)
  $0 first last (prints numbers in range first..last)
  $0 first increment last (prints numbers in range first..last in steps of increment)
EOF
  exit 1
fi

if test $increment -lt 1
then
  echo "Invalid increment value: $increment"
  exit 1
fi

current=$first
while test $current -le $last
do
  echo $current
  current="`expr $current + $increment`"
done
