#!/usr/bin/env bash

chmod +x release-properties.log
. ./release-properties.log

echo "Releasing ${ignite_version}${rc_name}"

unzip svn/vote/apache-ignite-fabric-*-bin.zip -d fabric

#uncomment subsequent line in case you want to remove incorrectly released vote
#svn rm -m "Removing redundant Release" https://svn.apache.org/repos/asf/ignite/site/trunk/releases/$ignite_version || true
svn import fabric/apache-ignite-fabric-$ignite_version-bin/docs https://svn.apache.org/repos/asf/ignite/site/trunk/releases/$ignite_version -m "new Release ($ignite_version)"
svn import fabric/apache-ignite-fabric-$ignite_version-bin/platforms/cpp/docs https://svn.apache.org/repos/asf/ignite/site/trunk/releases/$ignite_version/cppdoc -m "new Release (${ignite_version})"
svn import fabric/apache-ignite-fabric-$ignite_version-bin/platforms/dotnet/docs https://svn.apache.org/repos/asf/ignite/site/trunk/releases/$ignite_version/dotnetdoc -m "new Release (${ignite_version})"

echo "Please check results..."
read promt