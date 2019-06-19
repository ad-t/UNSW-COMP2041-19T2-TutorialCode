#!/bin/sh

while read zid name init
do 
  mark=`egrep "^$zid" marks.txt | cut -d' ' -f2`
  echo "$mark $name $init"
done < students.txt
