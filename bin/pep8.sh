#!/bin/bash

# Usage:
# blank - run all tests
# check numbers - run that specific test
# travis - run a set of checks that should always pass

exclude_amagama=\
build

exclude=\
$exclude_amagama

if [ -f "$1" -o -d "$1" ]; then
	files=$1
	shift
else
	files="."
fi

if [ "$1" == "travis" ]; then
	# For codes see http://pep8.readthedocs.org/en/latest/intro.html#error-codes
	select="--select=E10,E11,E261,E262,E27,E401,E70,E711,E721,W191,W291,W292,W293,W391,W60"
	count="--count"
elif [ $1 ]; then
	select="--select=$1"
else
	quiet="-qq"
	ignore="--ignore="
fi

pep8 $quiet \
     $count \
     --statistics \
     --exclude=$exclude \
     $select \
     $ignore \
     $files
