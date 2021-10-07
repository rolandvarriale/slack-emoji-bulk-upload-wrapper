#!/bin/bash

###################################################################
# Roland Varriale
# 2021
#
# This script will parse an html file, extract the yaml files that
# hold URLs for emojis, and download them into the current directory
# 
# I would recommend putting this in a clean directory
####################################################################

#grab all the YAML filesi
mkdir emojidump
cd emojidump
for i in `cat ../emojipacks.html | egrep -o '(https://raw).*(yaml)'| grep -v href`; #grab the individual PNGs from within the YAMLS
  do 
    for j in `curl -s $i| grep src |awk {'print $2'}`;
    do
      wget $j;#download the PNGs to the directory
    done
  done

#All emojis are downloaded to current directory

#The following line is an example of how to upload 
#pipenv run python upload.py emojjidump/*.jpeg;pipenv run python upload.py emojidump/*.jpg;pipenv run python upload.py emojidump/*.gif;pipenv run python upload.py emojidump/*.png
cd ..
