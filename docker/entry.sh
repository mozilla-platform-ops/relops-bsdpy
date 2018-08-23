#!/bin/sh

/usr/sbin/nginx -c /etc/nginx/nginx.conf

/usr/sbin/in.tftpd --listen --verbosity 10 --blocksize 1468 /nbi

/bsdpserver.py -p ${DOCKER_BSDPY_PATH} -i ${DOCKER_BSDPY_IFACE} -r ${DOCKER_BSDPY_PROTO}
