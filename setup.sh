#!/bin/bash

for file in src/*.sh; do
	chmod +x $file
	link="/home/$(whoami)/bin/$(awk -F\/ '{print $2}' <<< $file | sed 's/\.sh//g')"
	if [ -f $link ]
	then
		rm -f $link
	fi
	ln -s "$(pwd)/${file}" "$link"
done
