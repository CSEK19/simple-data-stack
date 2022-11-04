#!/bin/bash

# Start ssh server
/etc/init.d/ssh start

# Format namenode
$HADOOP_HOME/bin/hdfs namenode -format

# Start Hadoop
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver

# Keep container running
tail -f /dev/null