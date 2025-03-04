#!/bin/bash

url=$1
srctype=$2

mkdir downloads

if [ ! -f downloads/temp.zip ]; then
    wget -U "Mozilla/5.0" $url -O downloads/temp.zip
fi

./zip2img.sh downloads/temp.zip
mkdir system
sudo mount cache/system.img system
./make.sh system $srctype AB out
#./make.sh system $srctype Aonly

ls -ln out/