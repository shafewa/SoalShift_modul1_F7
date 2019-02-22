#!/bin/bash

for ((i=1;i<1000;i++))
do
	if [ ! -f password$i.txt ]
	then
		head /dev/urandom | tr -dc a-zA-Z0-9 | head -c12 > password$i.txt
		break
	fi
done
