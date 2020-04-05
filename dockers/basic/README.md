# Docker Basic Image

_Describes deployment process of basic image from ubuntu with the ubuntu user._

## Generating a new SSH key

Generating a new SSH key:
- name: _ubuntuSSH_
- id: _ubuntu_

````
$ ssh-keygen -t rsa -C "ubuntu"
````

## Setup SSH public key

Copy the new ssh key into one folder with the Dockerfile file.

## Deployment the basic docker image

Building with Dockerfile:

````
$ docker build -t quicklygabbing-ubuntu-basic-image:latest --compress -f Dockerfile ./
````

Building and deployment with the file docker-compose.yaml:

````
$ docker-compose build --no-cache
$ docker-compose up -d
````

## Connecting to new docker image

Example:
````
$ ssh -o "StrictHostKeyChecking no" -i ./ubuntuSSH_rsa -p 61022 ubuntu@localhost
````

