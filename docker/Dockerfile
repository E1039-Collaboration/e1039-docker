FROM scientificlinux/sl:7

RUN yum -y update && \
    yum -y install sudo screen wget patch libtool git-all gcc gcc-c++ gcc-gfortran \
           boost-devel python-devel cmake doxygen mariadb-devel sqlite-devel \
           zlib-devel freetype-devel pcre-devel xz-devel lz4-devel libX11-devel \
           libXpm-devel libXft-devel libXext-devel fftw-devel gsl-devel libxml2-devel \
           openssl-devel libXmu-devel xerces-c-devel mesa-libGL-devel mesa-libGLU-devel && \
    yum -y clean all && \
    echo "exclude=*" >> /etc/yum.conf
RUN useradd -d /home/e1039 -G wheel -m -U -p $(openssl passwd -1 spinquest) e1039 && \
    mkdir -p /opt/e1039 && chown -R e1039:e1039 /opt/e1039
ADD --chown=e1039:e1039 resource.tar.bz2 /opt/e1039

COPY sqconfig /usr/local/bin
#COPY this-e1039.sh /opt/e1039

USER e1039
WORKDIR /home/e1039
CMD ["/bin/bash"]