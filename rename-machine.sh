#!/bin/bash

vmloc = $1
oldname = $2
newname = $3

#move all of the files
for f in `ls $vmloc`; do
    mv $f `sed s/${oldname}/${newname}/`;
done

for f in `ls $vmloc`; do
    sed -i "s/${oldname}/${newname}/g" $f;
done
