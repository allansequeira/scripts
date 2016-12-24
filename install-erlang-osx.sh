#!/bin/sh
#
# Install script
#
# NOTE: Before you run this script, you must:
#       - Have Xcode tools installed. Xcode is available from the Apple Developer website
#       - Install wxWidgets. The 'observer' app (a replacement to 'appmon') uses wxWidgets for the GUI.
#         You can install wxWidgets by using the script install-wxwidgets.sh 
#	- Install openssl-1.0.2j. See install-openssl-1.0.2j-osx.sh
#
#
# Run the script as follows:
# sh install-erlang-macosx.sh <erlang_version>
# where,
#  erlang_version => the latest version can be obtained from www.erlang.org/download.html
#        For instance, the current latest version, as of 12/14/2016, is "19.2"
#
# Example:
# sh install-erlang-macosx.sh 19.2
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
  echo "Usage: sh install-erlang-macosx.sh <erlang_version>"
  exit 2
fi


# add JAVA_HOME/bin to PATH so we can use jniinterface
#export JAVA_HOME=$2
#export PATH=$JAVA_HOME/bin:$PATH

openssl_dir=/usr/local/ssl/openssl-1.0.2j

# grab current directory
current_dir=`pwd`
echo "current_dir: $current_dir"

mkdir -p ~/tools/lang/erlang
cd ~/tools/lang/erlang
install_dir=`pwd`
echo "install_dir: $install_dir"

# get erlang source
#curl -O http://erlang.org/download/otp_src_$1.tar.gz
#tar zxvf otp_src_$1.tar.gz
cd otp_src_$1

# If you are on Lion (OS/X 10.7) you can use LLVM, the default, or GCC to compile Erlang
# Using LLVM
#CFLAGS=-O0 ./configure --prefix=$install_dir/$1 --with-javac --enable-builtin-zlib --enable-dynamic-ssl-lib --with-wx

CFLAGS=-O0 ./configure --prefix=$install_dir/$1 --disable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --with-javac --with-ssl=$openssl_dir --enable-builtin-zlib --enable-dynamic-ssl-lib --with-wx

#CFLAGS=-O0 ./configure --prefix=$install_dir/$1 --disable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --with-javac --with-ssl=/usr/local/ssl/macos-x86_64 --with-ssl-incl=/usr/local/include/openssl --enable-builtin-zlib --enable-dynamic-ssl-lib --with-wx

# If you prefer GCC
#CC=gcc-4.2 CPPFLAGS='-DNDEBUG' MAKEFLAGS='-j 3' ./configure --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --enable-darwin-64bit --with-javac

# If you are on Snow Leopard (OS/X 10.6) or Leopard (OS/X 10.5) with an Intel processor:
#./configure --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll  --enable-darwin-64bit --with-javac

# If you are on a non-Intel processor or older version of OS/X:
#./configure --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll

# Build and Install (will be prompted for sudo password)
make && sudo make install


# back to original directory
cd $CURRENT_DIR


