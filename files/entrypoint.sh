#! /bin/bash
echo "starting fedora client" 
pwd
#ls -la /home/client
#ls -la /home/client/jdk8u192-b12
#export JAVA_HOME=/home/client/jdk8u192-b12 
#export PATH=$PATH:$JAVA_HOME/bin
printenv
java -version
echo
FEDORA_HOME=/home/client/fedora32 /home/client/fedora32/client/bin/fedora-admin.sh 