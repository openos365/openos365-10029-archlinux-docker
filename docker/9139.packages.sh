#!/usr/bin/env bash

#打开执行过程显示
set -x
#显示设置环境变量 CMD_PATH当前脚本所在目录
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