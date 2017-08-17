#!/bin/bash

libtype="$1"
program="$2"
outfile="$3"

usage()
{
	printf "Usage: $0 static/[dynamic] program.c(.cpp) output.a[.so]\n"
	exit 0
}

if [ -z "$libtype" ]
then
	usage
fi

if [ -z "$program" ]
then
	usage
fi

if [ "$libtype" == "static" ]
then
	gcc -Wall -Werror -c $program
	ar -cvq lib$outfile *.o
	ar -t lib$outfile
	rm *.o
fi

if [ "$libtype" == "dynamic" ]
then
	gcc -Wall -Werror -fPIC -c $program
	gcc -shared -Wl,-soname,lib$outfile.1 -o lib$outfile.1.0 *.o
	rm *.o
fi
