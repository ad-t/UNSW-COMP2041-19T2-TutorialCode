#!/bin/sh

# NOTE: This must be run in the root directory of this repository!

classes="wed11-strings wed17-brass"
data_dir="data"

for class in $classes
do
  cd $data_dir
  for week in `ls`
  do
    cd $week
    ln -s *.txt ../../$class/$week/
    cd ..
  done
  cd ..
done
