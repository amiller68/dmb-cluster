# Use a base image that supports systemd
FROM debian:latest

ENV container docker
ENV DEBIAN_FRONTEND=noninteractive

# Enable systemd.
RUN apt-get update && \
    apt-get install -y systemd systemd-sysv openssh-server sudo python3 python3-pip && \
    apt-get clean

# Set the root password
RUN echo 'root:root' | chpasswd

# Add a passwordless sudoer admin user
RUN useradd -m -s /bin/bash admin && \
    echo 'admin:admin' | chpasswd && \
    echo 'admin ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Ensure that the SSH service is enabled so that it starts on boot
RUN systemctl enable ssh

# Create necessary directory for SSHD to function properly
RUN mkdir /var/run/sshd

# Expose the SSH port
EXPOSE 22

# Use exec form of CMD to ensure systemd is PID 1
CMD [ "/usr/sbin/init" ]
