#!/bin/bash

hput() {
	[ $# -ne 3 ] && die "usage hput hashname key value" 1
	local hash="/tmp/hashmap.$1"
	local key=$2
	local value=$3
	if [ -f $hash ]
	then
		local index=$(grep -n "^$key" $hash | awk -F\: '{print $1}') || 0 # get line number of key
		[ ${index:=0} -ne 0 ] && sed -i "${index}d" $hash # if key exists remove it
	fi
	echo "$2 $3" >> $hash # put value to 
}

die() {
	echo $1
	exit $2
}

hput $@

