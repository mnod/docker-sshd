#! /bin/bash

PASS=`pwgen -s 12 1`
echo ${PASS}
echo docker:${PASS} | chpasswd

if [ $# -eq 1 ]; then
  sshdir=~docker/.ssh
  keyfile=$sshdir/authorized_keys
  mkdir $sshdir ; chmod 755 $sshdir
  touch $keyfile ; chmod 600 $keyfile
  echo $1 >> $sshdir/authorized_keys
  chown -R docker:docker $sshdir
fi

/usr/sbin/sshd -D
