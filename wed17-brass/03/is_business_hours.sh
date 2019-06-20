#!/bin/sh

hour=`date | egrep -o "[0-9]{2}:[0-9]{2}:[0-9]{2}" | sed "s/:.*//g"`

if test $hour -ge 9
then
  if test $hour -lt 17
  then
    exit 0
  fi
fi
exit 1
