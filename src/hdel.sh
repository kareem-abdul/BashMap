#!/bin/bash

hdel() {
	[ $# -eq 0 ] && die "usage hdel hashname [key]" 1
	local hash="/tmp/hashmap.$1"
	local key=$2
	if [ -f $hash ]
	then
		if [ ! -z $key ]
		then
			local index=$(grep -n "^$key" $hash | awk -F\: '{print $1}') # line number of $key in $hash
			[ ${index:=0} -ne 0 ] && sed -i "${index}d" $hash # if key exists delte it
		else
			rm $hash
		fi
	fi
}

die() {
	echo $1
	exit $2
}

hdel $@
