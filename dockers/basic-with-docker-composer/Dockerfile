FROM dennigogo/ubuntu-basic-image:latest

RUN cd /tmp \
&& apt update \
&& apt install -y \
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
# Clean apt
#
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
