#!/usr/bin/env bash

chmod +x release-properties.log
. ./release-properties.log

echo "Releasing ${ignite_version}${rc_name}"

#uncomment subsequent line in case you want to remove incorrectly released vote
#svn rm -m "Removing redundant Release" https://dist.apache.org/repos/dist/release/ignite/$ignite_version || true
svn mv https://dist.apache.org/repos/dist/dev/ignite/$ignite_version$rc_name https://dist.apache.org/repos/dist/release/ignite/$ignite_version -m "Release ${ignite_version}"

echo "Please check results..."
read promt