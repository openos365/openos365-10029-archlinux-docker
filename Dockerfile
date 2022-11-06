FROM archlinux

# Setup mirrors
RUN printf "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" \
        >> "$path/etc/pacman.conf" && \
    sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist && \
    curl -s https://blackarch.org/strap.sh | bash -

# Setup build dependencies
RUN pacman --noconfirm --noprogressbar --needed -Syyu base-devel

# Add builder User
RUN useradd -m -d /src -G wheel -g users runner -s /bin/bash && \
    echo "runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Change to user runner
USER runner
