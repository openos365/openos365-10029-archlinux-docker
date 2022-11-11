# 9318-archlinux-docker

[![docker build](https://github.com/archlinux365/9318-archlinux-docker/actions/workflows/docker_build.yml/badge.svg)](https://github.com/archlinux365/9318-archlinux-docker/actions/workflows/docker_build.yml)

## Support Contact:

 https://t.me/archlinux365
 
 <img src=https://user-images.githubusercontent.com/1329093/200988975-33a27396-74fa-44ed-9c16-e028e529d729.png width=20% />

### 1 what

archlinux-based docker: 
* more repos in pacman.conf, ()[]
* some packages 
* update everyday

## 2 why

* used for ci
* track version changes of packages

## 3 how to use

#### root user

```
docker pull ghcr.io/archlinux365/9318-archlinux-docker-root:latest
```
#### a normal user(sudo without password): runner 

```
docker pull ghcr.io/archlinux365/9318-archlinux-docker-runner:latest
```

