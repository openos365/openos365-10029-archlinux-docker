# 9318-archlinux-docker

### 1. what

* archlinux latest docker 
* add multilib
* add chaotic-aur
* add archlinuxcn
* add archedu
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
```

## 2 why

* add more repo
* update everday(by github actions: 0 1 * * *)

## 3 how to use

* 3.1 root user
```
docker pull ghcr.io/archlinux365/9318-archlinux-docker/root:latest

```
* 3.2 a normal user: runner without password

```
docker pull ghcr.io/archlinux365/9318-archlinux-docker/runner:latest
```

## used by projects

* https://github.com/archlinux365/9317-archlinux-aur
* https://github.com/alterlinux365/9312-alterlinux-iso
* https://github.com/uhuruos365/9313-uhuruos-iso
