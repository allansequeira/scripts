#!/bin/sh
#
# Install script for erlang on ubuntu
#
# NOTE: Before you run this script, you must:
#       - Install Oracle JDK. See install-oraclejdk-ubuntu.sh
#       - Install wxWidgets. The 'observer' app (a replacement to 'appmon') uses wxWidgets for the GUI.
#         You can install wxWidgets by using the script install-wxwidgets-ubuntu.sh
#         UPDATE (12/26/2016): For some reason, the erlang install cannot seem to link to wx.
#                              Therefore wx is disabled. And hence, apps like observer do not work, currently. 
#
#
# Run the script as follows:
# sh install-erlang-ubuntu.sh <erlang_version>
# where,
#  erlang_version => the latest version can be obtained from www.erlang.org/download.html
#        For instance, the current latest version, as of 12/26/2016, is "19.2"
#
# Example:
# sh install-erlang-ubuntu.sh 19.2
#
# The script does the following:
# - Downloads the erlang source
# - Untar's the source
# - Changes to source install directory
# - Make and install's erlang
#
##

if [ $# -lt 1 ]
then
  echo "Usage: sh install-erlang-ubuntu.sh <erlang_version>"
  exit 2
fi


# add JAVA_HOME/bin to PATH so we can use jniinterface
export JAVA_HOME=/home/rsequeira/tools/lang/java/latest
export PATH=$JAVA_HOME/bin:$PATH

# for wxwidgets. 
# RAS - 12/26/2016 - for whatever reason, configure cannot seem to link to the wx library despite
#                    exporting the LD_LIBRARY_PATH and running 'ldconfig /usr/local/lib'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# grab current directory
current_dir=`pwd`
echo "current_dir: $current_dir"

mkdir -p ~/tools/lang/erlang
cd ~/tools/lang/erlang
install_dir=`pwd`
echo "install_dir: $install_dir"

# get erlang source
curl -O http://erlang.org/download/otp_src_$1.tar.gz
tar zxvf otp_src_$1.tar.gz
cd otp_src_$1

CFLAGS=-O0 ./configure --prefix=$install_dir/$1 --enable-smp-support --enable-threads --enable-kernel-poll --with-javac --with-ssl --enable-builtin-zlib --enable-dynamic-ssl-lib --with-wx

# Build and Install (will be prompted for sudo password)
make && sudo make install


# back to original directory
cd $CURRENT_DIR


