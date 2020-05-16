# e1039-docker
Docker image of the e1039 software environment.

Note that the yum has been disabled by default, so that all the dependencies stay on the current version. To re-enable yum, open /etc/yum.conf and remove/comment out the last line. It is recommended to add that line back after the installation is done.
