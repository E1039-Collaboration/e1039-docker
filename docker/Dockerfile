FROM fermilab/fnal-wn-el9:latest

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install wget patch rsync libtool git-all gcc gcc-c++ gcc-gfortran \
           boost-devel python3-devel cmake mariadb mariadb-connector-c-devel \
	   sqlite-devel ncurses-devel libuuid-devel gtest-devel \
           zlib-devel bzip2 bzip2-devel freetype-devel pcre-devel xz-devel lz4-devel libX11-devel \
           libXpm-devel libXft-devel libXext-devel fftw-devel gsl-devel libxml2-devel \
           openssl-devel libXmu-devel xerces-c-devel mesa-libGL-devel mesa-libGLU-devel \
	   gl2ps-devel  && \
    yum -y clean all && \
    mkdir -p /opt/e1039

CMD ["/bin/bash"]
