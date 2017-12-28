# Quartus 11.1

if [ -n "${LM_LICENSE_FILE}" ] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:1810@cimekey1"
else
    export LM_LICENSE_FILE="1810@cimekey1"
fi

QUARTUS_ROOTDIR=/softslin/altera14_0/quartus
export QUARTUS_ROOTDIR
PATH="/softslin/altera14_0/quartus/bin:"${PATH}
export PATH

