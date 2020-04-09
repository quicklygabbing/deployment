# Docker Basic Image

_Describes deployment process of NODE.JS image from Ubuntu with the ubuntu user._

## Connecting to new docker image

Example:
````
$ ssh -o "StrictHostKeyChecking no" -i ./ubuntuSSH_rsa -p 61022 ubuntu@localhost
````

## Install Gatsby

Goto into SSH to run docker
````
$ cd www
$ git config --global user.email "ubuntu@localhost"
$ git config --global user.name "ubuntu"
$ sudo gatsby new gatsby-site
````

Additionaly
````
$ cd gatsby-site
$ gatsby develop
````
