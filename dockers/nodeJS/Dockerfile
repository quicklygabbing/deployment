FROM dennigogo/ubuntu-basic-image:latest

RUN cd /tmp \
#
# Setup Yarn, git
#
&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
&& sudo apt update \
&& sudo apt install -y git yarn \
#&& git config --global user.email "ubuntu@localhost" \
#&& git config --global user.name "ubuntu" \
#
# Setup Node.JS v12.16.2
#
&& wget https://nodejs.org/dist/v12.16.2/node-v12.16.2-linux-x64.tar.xz \
&& tar xf node-v12.16.2-linux-x64.tar.xz \
&& cd node-v12.16.2-linux-x64 \
&& rm *.md \
&& rm LICENSE \
&& sudo cp -rf * /usr \
#
# Setup Gatsbyjs
#
&& yarn global add gatsby-cli \
&& mkdir test \
&& cd test \
&& yarn add edit-json-file \
&& yarn add home-path \
&& echo 'var getHomePath = require('home-path');' | cat  >> app.js \
&& echo 'const editJsonFile = require("edit-json-file");' | cat >> app.js \
&& echo 'console.log(getHomePath()+`/.config/gatsby/config.json`);' | cat >> app.js \
&& echo 'let file = editJsonFile(getHomePath()+`/.config/gatsby/config.json`);' | cat >> app.js \
&& echo 'file.set("cli.packageManager", "yarn");' | cat >> app.js \
&& echo 'file.save();' | cat >> app.js \
&& cd /home/ubuntu \
#
# Clean apt
#
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /home/ubuntu/www
