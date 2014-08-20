# !/bin/bash

function usage()
{
    echo "createTags [targetPath]"
}

function main()
{
    if [ $# -lt 1 ]; then
        usage
        exit 1
    fi
    if [ ! -d $1 ]; then
        echo "not a directory $1"
        exit 1
    fi

    TARGET_PATH=$1
    ABSPATH=`cd $TARGET_PATH && pwd`

    ctags -f ${ABSPATH}/tags ${ABSPATH}
}

main $@
