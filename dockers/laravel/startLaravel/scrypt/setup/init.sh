apt update
apt install -y zlib1g zlib1g-dev

/usr/local/bin/docker-php-ext-install zip

composer global require laravel/installer

apt-get clean \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

cd /home/quicklygabbing/www