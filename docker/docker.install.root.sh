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
# 1 pacman.conf
cp -fv ./pacman.conf1 /etc/pacman.conf
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist

pacman -Syyu --noconfirm
curl -s https://blackarch.org/strap.sh | bash -

pacman-key --init
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

cp -fv ./pacman.conf2 /etc/pacman.conf

pacman -Syyu --noconfirm


export HOME=/root
export USER=root

# 2 Add builder User
cat /etc/passwd
groupadd runner
useradd -m -d /home/runner -G wheel -g runner runner -s /bin/bash
echo "root ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/root-nopassword
echo "runner ALL=(ALL) NOPASSWD: ALL"   > /etc/sudoers.d/runner-nopassword
chmod 750 /etc/sudoers.d/root-nopassword
chmod 750 /etc/sudoers.d/runner-nopassword
chmod 750 /etc/sudoers.d/
cat /etc/passwd

# 3 
pacman -Syyu --noconfirm
pacman -Su curl --noconfirm
pacman -Su glibc --noconfirm
# Prepare livesession settings and user
sed -i 's/#\(en_US\.UTF-8\)/\1/' "/etc/locale.gen"
sed -i 's/#\(zh_CN\.UTF-8\)/\1/' "/etc/locale.gen"

locale-gen

ln -sf "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime"

pacman --noconfirm --noprogressbar --needed -Syyu base-devel

pacman -Syyu --noconfirm
