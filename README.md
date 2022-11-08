# 9318-archlinux-docker

[![docker build](https://github.com/archlinux365/9318-archlinux-docker/actions/workflows/docker_build.yml/badge.svg)](https://github.com/archlinux365/9318-archlinux-docker/actions/workflows/docker_build.yml)

### 1. what

* archlinux latest docker 
* add multilib
* add chaotic-aur
* add archlinuxcn
* add arch4edu
* add endeavouros
* add a normal builder user(sudo nopasswd): runner
* install some packages:

```
git 
sudo 
python3 
base-devel 
cmake 
ninja 
qt5-base 
archiso 
arch-install-scripts 
pyalpm 
procps 
zsh 
wget 
git 
make 
sudo    
squashfs-tools 
libisoburn 
dosfstools 
openssh 
rsync
expect
```

## 2 why

* add more repo
* update everday(by github actions: 0 1 * * *)

## 3 how to use

* 3.1 root user
```
docker pull ghcr.io/archlinux365/9318-archlinux-docker/root:latest

```
history versions: https://github.com/orgs/archlinux365/packages/container/package/9318-archlinux-docker/root

* 3.2 a normal user: runner without password

```
docker pull ghcr.io/archlinux365/9318-archlinux-docker/runner:latest
```
history versions: https://github.com/orgs/archlinux365/packages/container/package/9318-archlinux-docker/runner

## 4 used by projects

* https://github.com/archlinux365/9317-archlinux-aur
* https://github.com/alterlinux365/9312-alterlinux-iso
* https://github.com/uhuruos365/9313-uhuruos-iso
* https://github.com/archlinux365/9280-endeavouros-pkgbuilds
