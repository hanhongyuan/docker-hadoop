#!/bin/bash

this_dir=`dirname $0`


docker ps -a | grep Exited | awk '{print $1}' | xargs docker rm -v
docker images | grep none | awk '{print $3}' | xargs docker image rm

modules=(hadoop single namenode datanode resourcemanager nodemanager mapred historyserver spark)
for m in ${modules[*]}
do
  if [ -d "$m" ]; then
  	build_sh=${this_dir}/${m}/dev/build.sh
   	echo "...: $build_sh"
    if [ -f "$build_sh" ]; then
    	echo "Will run: $build_sh $@"
    	/bin/sh -c "$build_sh $@"
    fi
  fi
done

# for i in ${this_dir}/*
# do
#   if [ -d "$i" ]; then
#   	build_sh=${this_dir}/${i}/dev/build.sh
#    	echo "...: $build_sh"
#     if [ -f "$build_sh" ]; then
#     	echo "Will run: $build_sh"
#     	/bin/sh -c $build_sh
#     fi
#   fi
# done
