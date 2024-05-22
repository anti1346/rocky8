FROM rockylinux/rockylinux:8

# Install systemd
RUN dnf install -y systemd

RUN dnf install -y procps

# Enable systemd init system
CMD ["/usr/lib/systemd/systemd"]
