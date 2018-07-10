#!/usr/bin/env bash

export $(cat .env | grep -v ^# | xargs)
ALLUXIO_HOME=$(pwd)/$(ls -d alluxio-$ALLUXIO_VER*/ | cut -f1 -d'/')
SPARK_HOME=$(pwd)/$(ls -d spark-$SPARK_VER*/ | cut -f1 -d'/')

cat <<EOF > ${SPARK_HOME}/conf/spark-env.sh
SPARK_DAEMON_JAVA_OPTS="
-Dspark.driver.extraClassPath `pwd`/`find . -name *-spark-client.jar`
"
EOF

cat <<EOF > ${SPARK_HOME}/conf/spark-defaults.conf
EOF

cat <<EOF > ${ALLUXIO_HOME}/conf/alluxio-env.sh
ALLUXIO_WORKER_MEMORY_SIZE=${ALLUXIO_WORKER_MEMORY_SIZE}

ALLUXIO_JAVA_OPTS="
-Dlog4j.configuration=file:${ALLUXIO_HOME}/conf/log4j.properties
-Dfs.s3n.awsAccessKeyId=${AWS_ACCESS_KEY_ID}
-Dfs.s3n.awsSecretAccessKey=${AWS_SECRET_KEY}
-Dalluxio.master.hostname=${ALLUXIO_MASTER_HOSTNAME}
-Dalluxio.worker.tieredstore.level0.dirs.quota=${ALLUXIO_WORKER_MEMORY_SIZE}
-Dalluxio.worker.tieredstore.level1.dirs.quota=${ALLUXIO_WORKER_SSD_SIZE}
"

EOF

cat <<EOF > ${ALLUXIO_HOME}/conf/alluxio-site.properties
alluxio.worker.tieredstore.levels=2
alluxio.worker.tieredstore.level0.alias=MEM
alluxio.worker.tieredstore.level0.dirs.path=/mnt/ramdisk
alluxio.worker.tieredstore.level0.watermark.high.ratio=0.9 # 216GB * 0.9 ~ 200GB
alluxio.worker.tieredstore.level0.watermark.low.ratio=0.75 # 216GB * 0.75 ~ 160GB
alluxio.worker.tieredstore.level1.alias=SSD
alluxio.worker.tieredstore.level1.dirs.path=/mnt/ssd1
alluxio.worker.tieredstore.level1.watermark.high.ratio=0.9 # 216GB * 0.9 ~ 200GB
alluxio.worker.tieredstore.level1.watermark.low.ratio=0.75 # 216GB * 0.75 ~ 160GB

alluxio.user.file.readtype.default=CACHE_PROMOTE
alluxio.user.file.writetype.default=MUST_CACHE

EOF
