#!/usr/bin/env bash

chmod +x release-properties.log
. ./release-properties.log

cd git

echo $ignite_version
echo $rc_name

git fetch --tags 
git tag -d $ignite_version$rc_name
git push origin :refs/tags/$ignite_version$rc_name

git status

git commit -a -m "version changed to: ${ignite_version}"
git tag -a $ignite_version$rc_name -m "${ignite_version}${rc_name}"
git push origin $ignite_version$rc_name