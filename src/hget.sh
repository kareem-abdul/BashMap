#!/bin/bash

hget() {
	local hash="/tmp/hashmap.$1"
	local key=$2
	if [ -f $hash ]
	then
		[ ! -z $key ] && echo $(grep "^$key" $hash | awk '{print $2}') || awk '{print $1}' $hash
	elif [ ! -z $1 ]
	then
		echo ""
	else
		echo $(ls "/tmp" | grep -o "hashmap\..*" | awk -F\. '{print $2}')
	fi

}

die() {
	echo $1
	exit $2
}

hget $@
