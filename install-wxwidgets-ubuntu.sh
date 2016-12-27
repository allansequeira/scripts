#!/bin/sh
#
# pre-requisites for installing:
#   sudo apt-get update
#   sudo apt-get install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev git
#   sudo libgtk-3-dev libqt4-opengl-dev
#
#   Also see this:  https://docs.basho.com/riak/kv/2.2.0/setup/installing/source/erlang/#debian-ubuntu-prerequisites

current_dir=`pwd`

# install wxWidgets
# Get wxWidgets-3.0
git clone -b WX_3_0_BRANCH https://github.com/wxWidgets/wxWidgets.git

cd wxWidgets

# Configure and build wxWidgets
#./configure --prefix=/usr/local --disable-shared --enable-unicode
./configure --prefix=/usr/local --enable-unicode
make
sudo make install

# check that you got the correct wx-config
which wx-config && wx-config --version-full
 
cd $current_dir