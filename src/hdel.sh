#!/bin/bash

hdel() {
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
	else
		local files=$(ls "/tmp" | grep -o "hashmap\..*")
		for file in $files; do
			[ $file=~"hashmap\..*" ] && rm "/tmp/$file"
		done
	fi
}

die() {
	echo $1
	exit $2
}

hdel $@
