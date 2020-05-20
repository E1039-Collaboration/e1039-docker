export     E1039_ROOT=$(dirname $(readlink -f $BASH_SOURCE))
export     E1039_CORE=$E1039_ROOT/${1:-core}
export    E1039_SHARE=$E1039_ROOT/${2:-share}
export E1039_RESOURCE=$E1039_ROOT/${3:-resource}

if [ -d $E1039_CORE ] ; then
    echo "Using E1039-CORE = ${E1039_CORE}"
else
    echo "${E1039_CORE} does not exist, will use default ${E1039_ROOT}/core."
fi

source $E1039_RESOURCE/this-resource.sh
source $E1039_SHARE/this-share.sh
source $E1039_CORE/this-core.sh
