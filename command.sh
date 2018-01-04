# Install python & pip
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-pip python3-pip

# Install java
sudo apt-get install default-jdk
sudo ln -s /usr/lib/jvm/java-1.7.0-openjdk-amd64 /opt/jdk
echo '' >> ~/.bashrc
echo 'export JAVA_HOME="/opt/jdk"' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Pull source
cd ~
mkdir hdfs-spark-hive && cd hdfs-spark-hive
git init
git remote add origin https://github.com/ardittot/hadoop-dev.git
git pull origin master

# Setup hadoop
make download
make configure
make start_hadoop
make start_spark
#Hive configuration requires Hadoop/HDFS running
make configure_hive
make start_hive_server
#In another terminal start beeline client
make start_hive_beeline_client
