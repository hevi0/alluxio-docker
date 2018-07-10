ALLUXIO_WORKER_MEMORY_SIZE=8GB

ALLUXIO_JAVA_OPTS="
-Dlog4j.configuration=file:/home/hevi/alluxio-docker/alluxio-1.6.1/conf/log4j.properties
-Dfs.s3n.awsAccessKeyId=AKIAJAPGP3KOWGOO4MCQ
-Dfs.s3n.awsSecretAccessKey=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
-Dalluxio.master.hostname=localhost
-Dalluxio.worker.tieredstore.level0.dirs.quota=8GB
-Dalluxio.worker.tieredstore.level1.dirs.quota=64GB
"

