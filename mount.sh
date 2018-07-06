#!/bin/sh

ALLUXIO_HOME=$(pwd)/alluxio-1.6.1
export $(cat .env | grep -v ^# | xargs)

$ALLUXIO_HOME/bin/alluxio fs mount --option aws.accessKeyId=$AWS_ACCESS_KEY_ID --option aws.secretKey=$AWS_SECRET_KEY /s3 $S3_FOLDER

#$ALLUXIO_HOME/bin/alluxio fs mount /hd ~/datasets

mkdir -p /mnt/alluxio
sudo chown -R $USER /mnt/alluxio
$ALLUXIO_HOME/integration/fuse/bin/alluxio-fuse.sh mount /mnt/alluxio

