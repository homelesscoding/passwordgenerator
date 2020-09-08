#!/bin/bash

# Usage: ./passgenerator.sh <characters-length>

a=$1

if [ -z $a ]; then
	a=15
elif ! [[ ! -n ${a//[0-9]/} ]]; then
	echo "Enter a numeric value" && exit
elif [ $a -gt 131061 ]; then
	echo "The value excede the limit" && exit
fi

tput setaf 1
echo ""
tr -dc !#$%/[]={}?+*-.:\A-Za-z0-9_ < /dev/urandom | head -c ${a} | xargs
echo ""
tput sgr0
