#!/bin/sh

if [ $# -eq 1 ]
then
  first=1
  increment=1
  last=$1
elif test $# -eq 2
then
  first=$1
  increment=1
  last=$2
elif test $# -eq 3
then
  first=$1
  increment=$2
  last=$3
else
  cat << EOF
Usage:
  $0: seq [first] [increment] last
EOF
fi

counter=$first
while test $counter -le $last
do
  echo "$counter"
  counter="`expr $counter + $increment`"
done

