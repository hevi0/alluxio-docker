# alluxio-docker

Copied from https://github.com/Alluxio/alluxio/tree/master/integration/docker

Also, see: https://www.alluxio.org/docs/1.6/en/Running-Alluxio-On-Docker.html

# Building and Running Through Docker
```
# Make SSD/HDD tier
mkdir -p /mnt/ssd1


# Make MEM tier outside of container, if you'd like (optional)
sudo mkdir /mnt/ramdisk
sudo mount -t ramfs -o size=8G ramfs /mnt/ramdisk
sudo chmod a+w /mnt/ramdisk
```

```
# Start master and worker
docker run -d --net=host \
             -v $PWD/tier1:/tier1 \
             alluxio local
```

# Running Locally

```
mkdir -p /mnt/ssd1
chmod -R 777 /mnt/ssd1
ALLUXIO_DIR=./alluxio-1.6.1
SPARK_DIR=./spark-2.2.1-bin-hadoop2.7

$ALLUXIO_DIR/bin/alluxio format
$ALLUXIO_DIR/bin/alluxio-start.sh local

$SPARK_DIR/bin/spark-shell
```

