#!/bin/bash

if [ ! -e "/sys/fs/cgroup" ]; then
  echo "Cannot find /sys/fs/cgroup. Please make sure your system is using cgroup v2"
  exit 1
fi

if [ -e "/sys/fs/cgroup/unified" ]; then
  echo "Combined cgroup v1+v2 mode is not supported. Please make sure your system is using pure cgroup v2"
  exit 1
fi

if [ ! -e "/sys/fs/cgroup/cgroup.subtree_control" ]; then
  echo "Cgroup v2 not found. Please make sure cgroup v2 is enabled on your system"
  exit 1
fi

cd /sys/fs/cgroup && \
mkdir isolate/ && \
echo 1 > isolate/cgroup.procs && \
echo '+cpuset +cpu +io +memory +pids' > cgroup.subtree_control && \
cd isolate && \
mkdir init && \
echo 1 > init/cgroup.procs && \
echo '+cpuset +memory' > cgroup.subtree_control && \
echo "Initialized cgroup" && \
chown -R judge0:judge0 /api && \
cron && \
exec su --preserve-environment judge0 -c "$@"
