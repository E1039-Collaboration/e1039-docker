# e1039-docker

## Introduction

Docker image of the e1039 software environment. The purpose of this image is to provide a clean and guaranteed-to-work environment for the E1039 software. The intended usage of this image could include:
- For users to quickly spin up a local software environment on their private computer, without any external dependencies on FNAL or E1039 computing resources;
- For developers to develop and test new features in a clean and isolated environment(s), without interfering with the host system for analysis work;

The image and examples shown in this README has been tested on Ubuntu, CentOS and Mac OS X. It is supposed to work on Windows 10 as well but Docker on Windows 10 requires pro edition.

## Docker installation and configuration

Refer to https://docs.docker.com/get-docker/ for the installation guide on your system. Docker on linux takes minimum resources and usually one can achieve performance similar to the level of a bare medal system; on Mac and Windows however docker is running on a virtualization layer which results in addtional performance overhead.

## Pull image from docker hub

The software team is responsible for building the docker image upon each release (defined by merging major pull requests). The latest PR No. is 78, to get this version, one should run the following command (assuming docker is installed and configured for non-priviledged access):

`> docker pull e1039/e1039-sw:pr78`

This command will download all the necessary files for the docker image from the docker hub. It may take severl minutes depending on the internet speed (the total download size is around 1.5GB). 

## Creating a container from the downloaded image

Once the image is downloaded, one can check its status by running `docker images`. Docker will list all the local images available, all e1039 software images will have the same repository name `e1039/e1039-sw`, different releases will be denoted by the different tag name. To start a system containing PR78 of the software, run the following command:

`docker run -it e1039/e1039-sw:pr78`

From this point, everything will look like it is in a ssh session on a remote linux server running scientific linux 7 with E1039 software installed, except that the server is actually running on the local computer. The default user name is `e1039` (with sudo priviledge) and the password is `spinquest`. For each image, one can initiate multiple containers which are completely separated from each other. For each container, an initialization process will run when it's started for the first time, this process will take 5 - 10 minutes. The initialization process will only run once and install all the latest E1039 software to `/opt/e1039` and provide an environment setup script `this-e1039.sh` at the same directory. A typical user case may look like:

```
e1039@docker ~: source /opt/e1039/this-e1039.sh
Using E1039-CORE = /opt/e1039/core
e1039@docker ~: git clone https://github.com/E1039-Collaboration/e1039-analysis.git
e1039@docker ~: cd e1039-analysis/SimChainDev
e1039@docker ~: root -l -b -q Fun4Sim.C\(100\)
```

Once the work is done, one can simply leave the docker container by `exit` in the terminal (just like in a ssh session). The container will be stopped and all the resources (other than disk space) will be released. The files generated inside the container is still persisted under the docker's storage management. It's similar to shutting off a virtual machine.

## Reconnect to a stopped container

To re-connect to a stopped container (like restart a stopped virtual machine), one needs to first obtain the container id by `docker ps -a` which will list the status of all the containers. The container id is the 12-character long hash code in the first column. To re-attach to a running container, run: `docker container attach <container id>`. If the container is already stopped (as shown in the STATUS column), it needs to be started first: `docker container start <container id>`.

## Some useful tips using docker

- Display GUI like ROOT plots: `docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix e1039/e1039-sw:pr78`
- Run multiple terminals with a single container: 1. start a container in deattached mode: `docker run -it -d ...`; 2. obtain the container id by `docker ps -a`; 3. start a separate bash terminal of that container: `docker exec -it <container id> bash`

## Other useful docker documentations

Visit <https://docs.docker.com/> for more complete docker documentation.


