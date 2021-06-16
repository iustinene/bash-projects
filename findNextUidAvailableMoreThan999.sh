#!/bin/bash

# Source: https://stackoverflow.com/questions/3649760/how-to-get-unique-uid


# return 1 if the Uid is already used, else 0
function usedUid()
{
    if [ -z "$1" ]
    then
    return
    fi
    for i in ${lines[@]} ; do
        if [ $i == $1 ]
        then
        return 1
    fi
    done
return 0
}

i=0

# load all the UIDs from /etc/passwd
lines=( $( cat /etc/passwd | cut -d: -f3 | sort -n ) )

testuid=999

x=1

# search for a free uid greater than 999 (default behaviour of adduser)
while [ $x -eq 1 ] ; do
    testuid=$(( $testuid + 1))
    usedUid $testuid
    x=$?
done

# print the just found free uid
echo $testuid
