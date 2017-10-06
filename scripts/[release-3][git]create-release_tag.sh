#!/usr/bin/env bash

chmod +x release.properties
. ./release.properties

echo "Releasing ${ignite_version}${rc_name}"

cd git

echo "Creating new tag..."
git tag -a $ignite_version -m "${ignite_version}"
git push origin $ignite_version

echo "Please check results..."
read promt