#!/bin/bash

for file in src/*.sh; do
	link="/home/$(whoami)/bin/$(awk -F\/ '{print $2}'<<<$file | sed 's/\.sh//g')"
	if [ -f $link ]
	then
		rm $link
	fi
done
