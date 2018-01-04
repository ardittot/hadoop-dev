# Install python & pip
sudo apt-get update
sudo apt-get upgrade
sudo apt-get python-pip python3-pip

# Install java
sudo apt-get install openjdk-8-jdk openjdk-8-source
sudo ln -s /usr/lib/jvm/java-1.8.0-openjdk-amd64 /opt/jdk
echo '' >> ~/.bashrc
echo 'export JAVA_HOME="/opt/jdk"' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

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
