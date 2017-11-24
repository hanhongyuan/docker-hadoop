#!/bin/bash
this_dir=`dirname $0`

image_name=andy/hadoop-namenode:latest
container_name=namenode-debugging

# docker ps -a | grep Exited | awk '{print $1}' | xargs docker rm -v
# docker images | grep none | awk '{print $3}' | xargs docker image rm

if [[ $1 == b ]]; then
	${this_dir}/build.sh
fi

docker stop  ${container_name}
docker rm -v ${container_name}
#docker run --rm -d --name ${container_name} andy/hadoop:latest
# docker run --rm -it -P --hostname ${container_name} --name ${container_name} $image_name /run.sh -bash




docker run --rm -it -p 50070:50070 --hostname namenode-debugging --name namenode-debugging andy/hadoop-namenode:latest /docker-hadoop-namenode/run.sh -bash