#!/bin/bash

# Copyright 2014, Stephen Rosen

#################################################################################
#                                                                               #
#   Licensed under the Apache License, Version 2.0 (the "License");             #
#   you may not use this file except in compliance with the License.            #
#   You may obtain a copy of the License at                                     #
#                                                                               #
#       http://www.apache.org/licenses/LICENSE-2.0                              #
#                                                                               #
#   Unless required by applicable law or agreed to in writing, software         #
#   distributed under the License is distributed on an "AS IS" BASIS,           #
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    #
#   See the License for the specific language governing permissions and         #
#   limitations under the License.                                              #
#                                                                               #
#################################################################################


vmloc="$1"
newname="$2"

# get the old name
oldname="$(basename "$(find "$vmloc" -name "*.vmx")" | sed 's/\.vmx$//')"

#move all of the files
for f in "$vmloc"/*;
do
    new_fname="${f//$oldname/$newname}"
    mv "$f" "$new_fname";
done

for f in "$vmloc"/*; do
    sed -i "s/${oldname}\./${newname}\./g" "$f";
done
