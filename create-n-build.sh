#!/bin/bash

cd ~
git clone https://fedorapeople.org/cgit/tachoknight/public_git/swift-lang.git
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cd swift-lang
cp ./*.patch ~/rpmbuild/SOURCES
cp ./swift-lang.conf ~/rpmbuild/SOURCES
cp ./swift-lang.spec ~/rpmbuild/SPECS

pushd ~/rpmbuild/SPECS
# Get the files
spectool -g -R ./swift-lang.spec
# Get the dependencies
dnf builddep -y ./swift-lang.spec
# Now do the actual build
rpmbuild -ba ./swift-lang.spec
popd
cp ~/rpmbuild/SRPMS/*.rpm /home/output
cp ~/rpmbuild/RPMS/x86_64/*.rpm /home/output
