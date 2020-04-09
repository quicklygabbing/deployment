FROM ubuntu:18.04

COPY ubuntuSSH_rsa.pub /tmp

RUN cd /tmp \
&& apt update \
&& apt install -y \
sudo bash openssh-server locales nano curl gnupg software-properties-common \
apt-transport-https ca-certificates gnupg-agent \
#
# Install Docker
#
&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
&& sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" \
&& apt update \
&& apt install -y docker-ce docker-ce-cli containerd.io \
#
# Install Docker Compose
#
&& curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
&& chmod +x /usr/local/bin/docker-compose \
&& ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
#
# Setup localedef
#
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
#
# Install sshd
#
&& mkdir /var/run/sshd \
&& sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config \
&& sed -ri 's/^#?AuthorizedKeysFile\s+.*//' /etc/ssh/sshd_config \
&& sed -ri 's/^#?#PasswordAuthentication\s+.*//' /etc/ssh/sshd_config \
&& sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
&& echo "AllowUsers ubuntu" >> /etc/ssh/sshd_config \
&& echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
&& echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config \
&& echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/sshd_config \
#
# Setup ssh root
#
&& mkdir /root/.ssh \
#
# Setup new user
#
&& useradd -U -p "$(openssl passwd -1 ubuntu)" ubuntu \
&& usermod -aG sudo ubuntu \
&& mkdir -p /home/ubuntu/.ssh \
&& echo "#ubuntu" >> /home/ubuntu/.ssh/authorized_keys \
&& cat /tmp/ubuntuSSH_rsa.pub >> /home/ubuntu/.ssh/authorized_keys \
&& chown -R ubuntu:ubuntu /home/ubuntu/ \
&& chmod 700 /home/ubuntu/.ssh \
&& chmod 600 /home/ubuntu/.ssh/authorized_keys \
&& echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
&& usermod -s /bin/bash ubuntu \
#
# Clean apt
#
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_US.utf8

EXPOSE 22

CMD ["/etc/init.d/dbus", "start"]
CMD ["/usr/sbin/sshd", "-D"]
