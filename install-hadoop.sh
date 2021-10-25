#!/bin/bash

# ===> Please provide hadoop version <===
#hadoop_ver=hadoop-2.10.1
hadoop_ver=hadoop-3.3.0
#hadoop_ver=hadoop-3.3.1
#hadoop_ver=hadoop-3.2.2

#######################################
hadoop_archive=$hadoop_ver'-aarch64.tar.gz'
hadoop_URL=https://dlcdn.apache.org/hadoop/common/hadoop-3.3.0/$hadoop_archive

# removing previous installation
rm -r /usr/local/hadoop 
rm -r ./$hadoop_archive

# preperations...
apt-get -y update
apt install openjdk-8-jre-headless
apt install wget

# installation ...
wget $hadoop_URL
tar -xvzf $hadoop_archive 
# !-d "/usr/local/hadoop" && mkdir -p "/usr/local/hadoop"
mv ./$hadoop_ver /usr/local/hadoop/ 

# configuring...
echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
echo "Hadoop was succesfully instaled."

