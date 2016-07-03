#! /bin/bash

PASS=`pwgen -s 12 1`
echo ${PASS}
echo docker:${PASS} | chpasswd

/usr/sbin/sshd -D
