#!/usr/bin/env bash


set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env

# 1 pacman.conf
cp -fv ./mirrorlist /etc/pacman.d/mirrorlist
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

pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

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



sed -i 's/#\(en_US\.UTF-8\)/\1/' "/etc/locale.gen"
sed -i 's/#\(zh_CN\.UTF-8\)/\1/' "/etc/locale.gen"
locale-gen
ln -sf "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime"


# pacman-key --populate
# pacman-key --refresh-keys
pacman -Syyu --noconfirm --verbose --debug

cat /etc/pacman.conf
cp -fv ./pacman.conf2 /etc/pacman.conf

pacman -Syyu --noconfirm --verbose --debug
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
pacman -Syyu --noconfirm golang
pacman -Syyu --noconfirm pacman-contrib
pacman -Syyu --noconfirm github-cli
pacman -Syyu --noconfirm rclone
pacman -Syyu --noconfirm jq
pacman -Syyu --noconfirm git-lfs
pacman -Syyu --noconfirm nvm
pacman -Syyu --noconfirm mongodb-tools
pacman -Syyu --noconfirm perl-rename



# build calamare-git
pacman -Syyu --noconfirm --needed cmake extra-cmake-modules kpmcore boost python-jsonschema python-pyaml python-unidecode qt5-svg qt5-webengine yaml-cpp networkmanager upower kconfig kservice squashfs-tools rsync qt5-xmlpatterns doxygen dmidecode gptfdisk hwinfo kparts solid qt5-tools libpwquality ckbcomp qt5-quickcontrols2

yay -S --noconfirm lure-bin
yay -S --noconfirm aliyunpan-cli

export HOME=/root
export USER=root

source /usr/share/nvm/init-nvm.sh

nvm install v14.21.3
nvm use v14.21.3
which node
which npm
node --version
npm --version

echo $PATH
npm install -g yarn
yarn global add steedos-cli

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
mkdir -p /opt/9138packages
git config --global user.email "gnuhub@gmail.com"
git config --global user.name "gnuhub"

export HOME=/root
export USER=root
export JABBA_VERSION=0.11.2
export JABBA_INDEX=https://github.com/typelevel/jdk-index/raw/main/index.json
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash 
. /root/.jabba/jabba.sh
jabba ls-remote


 jabba install corretto@20
 jabba install corretto@19
 jabba install corretto@17
 jabba install corretto@11
 jabba install corretto@8
 jabba install graalvm@19
 jabba install graalvm@17
 jabba install graalvm@11
 jabba install openj9@17
 jabba install openj9@11
 jabba install openj9@8
 jabba install oracle@20
 jabba install oracle@19
 jabba install oracle@17
 jabba install temurin@20
 jabba install temurin@19
 jabba install temurin@17
 jabba install temurin@11
 jabba install temurin@8

curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
source /root/.gvm/scripts/gvm
gvm install go1.17
gvm use go1.17

git clone https://github.com/cooperspencer/gickup.git
cd gickup
go build .
cp -fv ./gickup /usr/bin/gickup
which gickup
gickup --help

cd /root/
git clone https://github.com/nvm-sh/nvm.git .nvm
cd .nvm
git checkout v0.39.5

. /root/.nvm/nvm.sh
nvm install v14.21.3
nvm use v14.21.3
npm install yarn -g
npm install meteor -g
export PATH=$HOME/.meteor:$PATH
echo $PATH
which node
node --version
set -x


cd /root/
rm -rf steedos-platform
git clone --depth=1 -b 2.5 https://github.com/steedos/steedos-platform.git
cd steedos-platorm
cd steedos-platform
yarn --frozen-lockfile
export PATH=$(yarn bin):$PATH
yarn list > yarn.list.origin.txt
cd creator
which meteor
meteor --version
yarn --frozen-lockfile
meteor list
meteor list > meteor.list.origin.txt
meteor list --tree > meteor.list.tree.origin.txt
yarn build-debug
yarn list > yarn.creator.list.origin.txt

cd /opt/9138packages
cp /opt/9139.packages.sh ./
chmod +x *.sh 
./9139.packages.sh
git init 
git add .
git commit -a -m "add"

# clean
rm -rf /var/cache/pacman/pkg/
