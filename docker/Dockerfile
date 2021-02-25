FROM fermilab/fnal-wn-sl7

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install wget patch libtool git-all gcc gcc-c++ gcc-gfortran \
           boost-devel python-devel cmake doxygen mariadb-devel sqlite-devel ncurses-devel \
           zlib-devel bzip2-devel freetype-devel pcre-devel xz-devel lz4-devel libX11-devel \
           libXpm-devel libXft-devel libXext-devel fftw-devel gsl-devel libxml2-devel \
           openssl-devel libXmu-devel xerces-c-devel mesa-libGL-devel mesa-libGLU-devel \
	   gl2ps-devel xxhash-devel  && \
    yum -y clean all && \
    mkdir /e906

CMD ["/bin/bash"]
