#!/bin/bash

export $(cat .env | grep -v ^# | xargs)

ALLUXIO_HOME=$(pwd)/alluxio-${ALLUXIO_VER}
SPARK_HOME=$(pwd)/spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}

${ALLUXIO_HOME}/bin/alluxio-start.sh local NoMount

sleep 3

# Mount nested understorage drives
$ALLUXIO_HOME/bin/alluxio fs mount --option aws.accessKeyId=$AWS_ACCESS_KEY_ID --option aws.secretKey=$AWS_SECRET_KEY /s3 $S3_FOLDER

#$ALLUXIO_HOME/bin/alluxio fs mount /hd ~/

rm -f alluxio
rm -f spark
ln -s $ALLUXIO_HOME alluxio
ln -s $SPARK_HOME spark

