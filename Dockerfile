FROM docker.io/library/archlinux:latest
USER root
ENV TERM=xterm-256color
COPY docker/ /opt
RUN /opt/docker.install.root.sh


