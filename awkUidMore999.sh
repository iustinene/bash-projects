#! /bin/bash

awk -F ':' '$3>=1000 {print "Valid User with UID greater than 999 :"$1","$3}'  /etc/passwd