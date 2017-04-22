#!/bin/sh
#
# Install openssl-1.0.2j
#
# Post-installation, update the PATH variable to point to the new openssl install as follows:
#	export OPENSSL_HOME=/usr/local/ssl/openssl-1.0.2j
#	export PATH=$OPENSSL_HOME/bin:$PATH
#

VERSION=openssl-1.0.2j

current_dir=`pwd`
echo "current_dir: $current_dir"

mkdir -p ~/tmp
cd ~/tmp

# make logs directory
mkdir -p ~/tmp/logs/$VERSION

curl -O https://www.openssl.org/source/$VERSION.tar.gz
tar zvxf $VERSION.tar.gz
cd $VERSION

# Configure with "no-krb5"
./configure darwin64-x86_64-cc shared enable-ec_nistp_64_gcc_128 no-ssl2 no-ssl3 no-comp --openssldir=/usr/local/ssl/openssl-1.0.2j --prefix=/usr/local/ssl/openssl-1.0.2j no-krb5 1>~/tmp/logs/openssl-1.0.2j/configure.log

make depend 1>~/tmp/logs/openssl-1.0.2j/makedepend.log

sudo make install 1>~/tmp/logs/openssl-1.0.2j/makeinstall.log




