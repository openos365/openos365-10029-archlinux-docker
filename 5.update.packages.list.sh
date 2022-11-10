#!/usr/bin/env bash

set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH
sudo docker pull ghcr.io/archlinux365/9318-archlinux-docker/root:latest
sudo docker run ghcr.io/archlinux365/9318-archlinux-docker/root:latest pacman -Sl > packages.list.all.txt
sudo docker run ghcr.io/archlinux365/9318-archlinux-docker/root:latest pacman -Qe > packages.list.installed.txt
