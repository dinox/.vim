#!/bin/sh

remote_file=UPSTREAM

cd bundle
for dir in */
do
    cd $dir || continue
    if ! [ -e $remote_file ]
    then
        echo "$dir: no remote file!"
        continue
    else
        if ! [ -d .git ]
        then
            git init
        fi
        if ! git remote | grep upstream > /dev/null
        then
            git remote add upstream `cat $remote_file`
        fi
        git pull upstream master
    fi
    cd ..
done

