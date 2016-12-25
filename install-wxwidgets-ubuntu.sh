#!/bin/sh

# pre-requisites - install the following
#   sudo apt-get update
#   sudo apt-get install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev
#   sudo libgtk-3-dev

# install wxWidgets
# Get wxWidgets-3.0
git clone -b WX_3_0_BRANCH https://github.com/wxWidgets/wxWidgets.git

# Configure and build wxWidgets
cd wxWidgets
./configure --prefix=/usr/local --disable-shared --enable-unicode
make
sudo make install

# check that you got the correct wx-config
which wx-config && wx-config --version-full