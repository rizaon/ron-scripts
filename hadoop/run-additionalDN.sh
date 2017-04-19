#!/bin/sh
# This is used for starting multiple datanodes on the same machine.
# run it from hadoop-dir/ just like 'bin/hadoop' 

#Usage: run-additionalDN.sh [start|stop] dnnumber
#e.g. run-datanode.sh start 2

DN_DIR_PREFIX="/tmp/hadoop-cc/"

if [ -z $DN_DIR_PREFIX ]; then
echo $0: DN_DIR_PREFIX is not set. set it to something like "/hadoopTmp/dn"
exit 1
fi

run_datanode () {
# DN should be 3 digits
DN=$2
export HADOOP_LOG_DIR=$DN_DIR_PREFIX$DN/logs
export HADOOP_PID_DIR=$HADOOP_LOG_DIR
DN_CONF_OPTS="\
-Dhadoop.tmp.dir=$DN_DIR_PREFIX$DN \
-Ddfs.datanode.address=0.0.0.0:51$DN \
-Ddfs.datanode.http.address=0.0.0.0:58$DN \
-Ddfs.datanode.ipc.address=0.0.0.0:52$DN "

hadoop-daemon.sh --script hdfs $1 datanode $DN_CONF_OPTS
}

cmd=$1
shift;

for i in $*
do
run_datanode  $cmd $i
done
