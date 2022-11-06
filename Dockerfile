FROM docker.io/library/archlinux:latest
USER root
ENV TERM=xterm-256color
COPY docker/ /opt
RUN /opt/docker.install.root.sh

# Change to user builder
USER runner

# Change working directory
WORKDIR /home/runner
RUN /opt/docker.install.runner.sh

