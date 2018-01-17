#!/usr/bin/env bash

REPO_ROOT="svn/vote/rpm"

#
# Install required packages if necessary
#
if [ ! -f /usr/bin/rpm -o ! -f /usr/bin/rpmsign -o ! -f /usr/bin/createrepo ]
then
    echo "# Installing requred packages #"
    sudo apt-get update
    sudo apt-get install createrepo rpm --no-install-recommends -y
fi

#
# Prepare repository root
#
echo "# Preparing repository root #"
mkdir -pv ${REPO_ROOT}
mv -v *.rpm ${REPO_ROOT}

#
# Sign RPM
#
echo "# Signing RPM #"
rpm --define "_gpg_name $(gpg --list-keys | grep uid | sed -r 's|uid\ +(.*)|\1|')" --addsign ${REPO_ROOT}/*.rpm

#
# Create repository layout
#
echo "# Creating repository layout #"
createrepo -v -p -s sha512 --update ${REPO_ROOT}

