FROM rockylinux/rockylinux:8

# Install systemd
RUN dnf -y install systemd

# Enable systemd init system
CMD ["/usr/lib/systemd/systemd"]
