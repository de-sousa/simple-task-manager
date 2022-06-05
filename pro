#!/bin/bash

set -e

if [ $# == 0 ];
then
    echo "Lacks SubCommand"
    exit 1
fi

PROJECT_FOLDER=~/.projects/projects/
PROJECT_HISTORY_FOLDER=~/.projects/history/
PROJECT_TMP_FILE=/tmp/project-tmp-file

PREFIX="> "

case $1 in
    "all")
	find $PROJECT_FOLDER -type f | sed "s|$PROJECT_FOLDER|$PREFIX|"
	exit 0
	;;
	
    "next")
	if [ $# == 2 ];
	then
	    awk -i inplace "NF!=0" $PROJECT_FOLDER$2
	    head -n 1 $PROJECT_FOLDER$2
	else
	    echo
	    for file in $(find $PROJECT_FOLDER -type f)
	    do
		awk -i inplace "NF!=0" $file
		echo $file | sed "s|$PROJECT_FOLDER|$PREFIX|"
		head -n 1 $file
		echo 
	    done
	fi
	exit 0
	;;
esac

if [ $# == 1 ];
then
    echo "Unknown Subcommand"
    exit 1
fi

case $1 in
    "add")
	mkdir -p $PROJECT_FOLDER$(dirname $2)
	touch $PROJECT_FOLDER$2
	if [ $# == 2 ];
	then
	    cat >> $PROJECT_FOLDER$2
	else
	    echo $3 >> $PROJECT_FOLDER$2
	fi
	exit 0
	;;
    "remove")
	rm -r $(echo $PROJECT_FOLDER$2 | sed "s|\.\.|\.|g")
	for empty_dir in $(find $PROJECT_FOLDER -type d -empty)
	do
	    rmdir $empty_dir
	done
	exit 0
	;;
    "done")
	awk -i inplace "NF!=0" $PROJECT_FOLDER$2
	mkdir -p $PROJECT_HISTORY_FOLDER$(dirname $2)
	touch $PROJECT_HISTORY_FOLDER$2
	echo "DONE:"
	TASK=$(head -n 1 $PROJECT_FOLDER$2)
	echo $TASK
	echo $TASK >> $PROJECT_HISTORY_FOLDER$2
	awk "NR>1" $PROJECT_FOLDER$2 > $PROJECT_TMP_FILE
	cat $PROJECT_TMP_FILE > $PROJECT_FOLDER$2
	exit 0
	;;
    "show")
	awk -i inplace "NF!=0" $PROJECT_FOLDER$2
	cat $PROJECT_FOLDER$2
	exit 0
	;;
esac
