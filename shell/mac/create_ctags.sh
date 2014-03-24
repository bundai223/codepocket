# !/bin/bash

TAGFILE_DIR=`dirName $0`

ctags -f ${TAGFILE_DIR}/tags -R ${TAGFILE_DIR}

