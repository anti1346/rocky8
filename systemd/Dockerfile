FROM rockylinux/rockylinux:8

LABEL website="sangchul.kr"

ARG SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD:-root}
ARG SSH_USER=${SSH_USER:-rocky}
ARG SSH_PASSWORD=${SSH_PASSWORD:-rocky}

ENV SSH_ROOT_PASSWORD=${SSH_ROOT_PASSWORD}
ENV SSH_USER=${SSH_USER}
ENV SSH_PASSWORD=${SSH_PASSWORD}

ENV TZ=Asia/Seoul

USER root

# Install necessary packages
RUN dnf install -y \
    systemd \
    procps \
    sudo \
    passwd \
    openssh-server \
    net-tools \
    iputils \
    bind-utils \
    nc \
    curl \
    vim \
    && dnf clean all

# Set timezone to Asia/Seoul
ENV TZ=Asia/Seoul

# Set SSH root password
RUN echo "root:$SSH_ROOT_PASSWORD" | chpasswd \
    && echo 'export PS1="\[\033[01;32m\]\u\[\e[m\]\[\033[01;32m\]@\[\e[m\]\[\033[01;32m\]\h\[\e[m\]:\[\033[01;34m\]\W\[\e[m\]$ "' >> ~/.bashrc

# Create a non-root user
RUN useradd -c "$SSH_USER" -m -d /home/$SSH_USER -s /bin/bash $SSH_USER \
    && echo "$SSH_USER:$SSH_PASSWORD" | chpasswd \
    && echo 'export PS1="\[\e[33m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:\[\033[01;31m\]\W\[\e[m\]$ "' >> /home/$SSH_USER/.bashrc \
    && echo "$SSH_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# SSH Configure Settings
RUN sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service and systemd
CMD ["/usr/lib/systemd/systemd", "&&", "systemctl", "--now", "enable", "sshd"]
