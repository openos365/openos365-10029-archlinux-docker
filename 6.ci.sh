#!/usr/bin/env bash

set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

cp -fv known_hosts /home/runner/.ssh/known_hosts
ssh-keygen -f "/home/runner/.ssh/known_hosts" -R "frs.sourceforge.net"
ssh-keyscan "frs.sourceforge.net" >> /home/runner/.ssh/known_hosts
ssh-keygen -f "/home/runner/.ssh/known_hosts" -R "github.com"
ssh-keyscan "github.com" >> /home/runner/.ssh/known_hosts
cat /home/runner/.ssh/known_hosts

git config --global user.email "gnuhub@gmail.com"
git config --global user.name "gnuhub"

cd ~
git clone git@github.com:opendde/10018-opendde-aur-database.git
cd 10018-opendde-aur-database

./101.aur.all.list.gen.sh




