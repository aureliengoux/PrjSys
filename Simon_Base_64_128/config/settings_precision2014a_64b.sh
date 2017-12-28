#
# MENTOR GRAPHICS Precision Synthesis 2014a 64 bits session 
#

export PRECISION_HOME=/softslin/precision2014a_64b/Mgc_home

export PATH="${PATH}:${PRECISION_HOME}/bin"

if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:1717@v212:1718@cimekey1"
else
    export LM_LICENSE_FILE="1717@v212:1718@cimekey1"
fi

