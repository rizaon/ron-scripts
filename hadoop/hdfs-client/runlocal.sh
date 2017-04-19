#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#hadoop jar $DIR/RandomWriter.jar RandomWriter $1 $BLOCKPERFILE $HOSTNAME-2 > /dev/null 2> /dev/null &

#exit

for i in `seq 1 128`;
do
    hadoop jar $DIR/RandomWriter.jar RandomWriter 1 320 $HOSTNAME-$i > /dev/null 2> /dev/null &
done
