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
cat /etc/pacman.d/mirrorlist
pacman -Syyu --noconfirm
curl -s https://blackarch.org/strap.sh | bash -
sed -i 's/^#Server/Server/' /etc/pacman.d/blackarch-mirrorlist
cat /etc/pacman.d/blackarch-mirrorlist

curl https://raw.githubusercontent.com/archlinuxcn/mirrorlist-repo/master/archlinuxcn-mirrorlist > /etc/pacman.d/archlinuxcn-mirrorlist
sed -i 's/^# Server/Server/' /etc/pacman.d/archlinuxcn-mirrorlist
cat /etc/pacman.d/archlinuxcn-mirrorlist

curl https://raw.githubusercontent.com/arch4edu/mirrorlist/master/mirrorlist.arch4edu > /etc/pacman.d/arch4edu-mirrorlist
sed -i 's/^#Server/Server/' /etc/pacman.d/arch4edu-mirrorlist
cat /etc/pacman.d/arch4edu-mirrorlist

# https://gitlab.com/endeavouros-filemirror/PKGBUILDS/-/blob/master/endeavouros-mirrorlist/endeavouros-mirrorlist
curl https://gitlab.com/endeavouros-filemirror/PKGBUILDS/-/raw/master/endeavouros-mirrorlist/endeavouros-mirrorlist > /etc/pacman.d/endeavouros-mirrorlist


pacman-key --init
# chaotic
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036

# arch4edu
pacman-key --recv-keys 7931B6D628C8D3BA
pacman-key --finger 7931B6D628C8D3BA
pacman-key --lsign-key 7931B6D628C8D3BA

# eos
curl https://raw.githubusercontent.com/endeavouros-team/keyring/main/endeavouros.gpg > /opt/endeavouros.gpg
pacman-key --add /opt/endeavouros.gpg
pacman-key --lsign-key 497AF50C92AD2384C56E1ACA003DB8B0CB23504F

pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
cat /etc/pacman.d/chaotic-mirrorlist


pacman-key --populate
pacman-key --refresh-keys
pacman -Syy --noconfirm

cat /etc/pacman.conf
cp -fv ./pacman.conf2 /etc/pacman.conf

pacman -Syyu --noconfirm
pacman -Syyu archlinuxcn-keyring --noconfirm

pacman -Syyu --noconfirm git 
pacman -Syyu --noconfirm sudo 
pacman -Syyu --noconfirm python3 
pacman -Syyu --noconfirm base-devel 
pacman -Syyu --noconfirm cmake 
pacman -Syyu --noconfirm ninja 
pacman -Syyu --noconfirm qt5-base 
pacman -Syyu --noconfirm archiso 
pacman -Syyu --noconfirm arch-install-scripts 
pacman -Syyu --noconfirm pyalpm 
pacman -Syyu --noconfirm procps 
pacman -Syyu --noconfirm zsh 
pacman -Syyu --noconfirm wget 
pacman -Syyu --noconfirm git 
pacman -Syyu --noconfirm make 
pacman -Syyu --noconfirm sudo    
pacman -Syyu --noconfirm squashfs-tools 
pacman -Syyu --noconfirm libisoburn 
pacman -Syyu --noconfirm dosfstools 
pacman -Syyu --noconfirm openssh 
pacman -Syyu --noconfirm rsync
pacman -Syyu --noconfirm expect
pacman -Syyu --noconfirm minio-client
pacman -Syyu --noconfirm yay

export HOME=/root
export USER=root

# 2 Add builder User
cat /etc/passwd
groupadd runner
useradd -m -d /home/runner -G wheel -g runner runner -s /bin/bash
mkdir -p /etc/sudoers.d
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
pacman -Scc --noconfirm
mkdit -p /opt/9138packages
git config --global user.email "gnuhub@gmail.com"
git config --global user.name "gnuhub"
cd /opt/9138packages
cp /opt/9139.packages.sh ./
chmod +x *.sh 
./9139.packages.sh
git init 
git add .
git commit -a -m "add"
