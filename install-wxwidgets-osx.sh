#!/bin/sh

# install wxWidgets
# Get wxWidgets-3.0
git clone -b WX_3_0_BRANCH https://github.com/wxWidgets/wxWidgets.git

# Configure and build wxWidgets
cd wxWidgets
./configure --with-cocoa --prefix=/usr/local
make
sudo make install

# check that you got the correct wx-config
which wx-config && wx-config --version-full



