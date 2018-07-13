ALLUXIO_WORKER_MEMORY_SIZE=8GB

ALLUXIO_JAVA_OPTS="
-Dlog4j.configuration=file:/home/hevi/alluxio-docker/alluxio-1.6.1/conf/log4j.properties
-Dalluxio.master.hostname=localhost
-Dalluxio.worker.tieredstore.level0.dirs.quota=8GB
-Dalluxio.worker.tieredstore.level1.dirs.quota=64GB
"

