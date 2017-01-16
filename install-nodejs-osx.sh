#!/bin/sh
#
# Install script for node.js
#
# Run the script as follows:
# sh install-nodejs-osx.sh <nodejs_version>
# where,
#  nodejs_version => the latest version can be obtained from https://nodejs.org/en/download/
#        For instance, the current latest version, as of 01/15/2016, is "6.9.4"
#
# Example:
# sh install-nodejs-osx.sh 6.9.4
#
# The script does the following:
# - Downloads the nodejs binary (tar.gz)
# - Untar's the binary
#
# Remember to reset the "latest" symlink to point to the version you downloaded.
# Remember to add <nodejs_home>/bin to the PATH env variable.
#

if [ $# -lt 1 ]
then
  echo "Usage: sh install-nodejs.sh <nodejs_version>"
  exit 2
fi

# grab current directory
current_dir=`pwd`
echo "current_dir: $current_dir"

mkdir -p ~/tools/server/node
cd ~/tools/server/node
install_dir=`pwd`
echo "install_dir: $install_dir"

# get nodejs source
curl -O https://nodejs.org/dist/v$1/node-v$1-darwin-x64.tar.gz 
tar zxvf node-v$1-darwin-x64.tar.gz
cd node-v$1-darwin-x64

# print the nodejs and npm versions
bin/node --version
bin/npm --version

# back to original directory
cd $CURRENT_DIR

