#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env
pacman -Su curl --noconfirm

# https://hustlei.github.io/2018/11/msys2-pacman.html
pacman -Sl > packages.list.all.txt
pacman -Qe > packages.list.installed.txt