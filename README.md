# 9318-archlinux-docker

[![docker build](https://github.com/archlinux365/9318-archlinux-docker/actions/workflows/docker_build.yml/badge.svg)](https://github.com/archlinux365/9318-archlinux-docker/actions/workflows/docker_build.yml)

### 1 what

archlinux-based docker: 
* more repos
* some packages 
* update everyday

## 2 why

* used for ci

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
