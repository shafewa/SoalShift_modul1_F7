#!/bin/bash

for x in *.jpg
do
	base64 -d $x | xxd -r > /home/shafewa/Documents/sisop/soal1/jadi/$x
done
