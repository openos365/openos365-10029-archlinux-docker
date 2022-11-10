#!/usr/bin/env bash


set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env
# 1 pacman.conf
cp -fv ./pacman.conf1 /etc/pacman.conf
cp -fv ./alterlinux-mirrorlist /etc/pacman.d/alterlinux-mirrorlist
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
curl https://raw.githubusercontent.com/arcolinux/arcolinux-mirrorlist/master/etc/pacman.d/arcolinux-mirrorlist > /etc/pacman.d/arcolinux-mirrorlist


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


# pacman-key --populate
# pacman-key --refresh-keys
pacman -Syyu --noconfirm --verbose --debug

cat /etc/pacman.conf
cp -fv ./pacman.conf2 /etc/pacman.conf

pacman -Syyu --noconfirm --verbose --debug
pacman -S archlinuxcn-keyring --noconfirm

pacman -S --noconfirm git 
pacman -S --noconfirm sudo 
pacman -S --noconfirm python3 
pacman -S --noconfirm base-devel 
pacman -S --noconfirm cmake 
pacman -S --noconfirm ninja 
pacman -S --noconfirm qt5-base 
pacman -S --noconfirm archiso 
pacman -S --noconfirm arch-install-scripts 
pacman -S --noconfirm pyalpm 
pacman -S --noconfirm procps 
pacman -S --noconfirm zsh 
pacman -S --noconfirm wget 
pacman -S --noconfirm git 
pacman -S --noconfirm make 
pacman -S --noconfirm sudo    
pacman -S --noconfirm squashfs-tools 
pacman -S --noconfirm libisoburn 
pacman -S --noconfirm dosfstools 
pacman -S --noconfirm openssh 
pacman -S --noconfirm rsync
pacman -S --noconfirm expect
pacman -S --noconfirm minio-client
pacman -S --noconfirm yay
pacman -S --noconfirm pacman-contrib


# build calamare-git
pacman -Syyu --noconfirm --needed cmake extra-cmake-modules kpmcore boost python-jsonschema python-pyaml python-unidecode qt5-svg qt5-webengine yaml-cpp networkmanager upower kconfig kservice squashfs-tools rsync qt5-xmlpatterns doxygen dmidecode gptfdisk hwinfo kparts solid qt5-tools libpwquality ckbcomp qt5-quickcontrols2

yay -S --noconfirm lure-bin

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

# clean
rm -rf /var/cache/pacman/pkg/
