#!/bin/bash

if [ $# -lt 1 ]; then
  echo "$0 <remote-host>"
  echo ""
  echo "example:"
  echo "  $0 username@example.com"
  echo "  $0 melpon-builder"
  exit 1
fi

BASE_DIR=$(cd $(dirname $0); pwd)
rsync -rlpt --delete -v $BASE_DIR/wandbox $1:/opt/
# TODO: cattleshedのためにこれを実行する必要がある（要root権限）
# ssh $1 setcap cap_sys_admin,cap_sys_chroot,cap_mknod,cap_net_admin=p /opt/wandbox/cattleshed/bin/cattlegrid
