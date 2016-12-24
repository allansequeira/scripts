#!/bin/sh

# get current directory
current_dir=`pwd`

# make required directories
mkdir -p ~/tools/lang/java
cd ~/tools/lang/java

# unpack the archive
tar zxvf jdk-8u112-linux-x64.tar.gz
ln -s jdk1.8.0_112 latest

# inform Ubuntu where Oracle JDK/JRE is located
sudo update-alternatives --install "/usr/bin/java" "java" "/home/rsequeira/tools/lang/java/latest/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/home/rsequeira/tools/lang/java/latest/bin/javac" 1

# inform Ubuntu that Oracle JDK/JRE is the default java
sudo update-alternatives --set java /home/rsequeira/tools/lang/java/latest/bin/java
sudo update-alternatives --set javac /home/rsequeira/tools/lang/java/latest/bin/javac

cd $current_dir
