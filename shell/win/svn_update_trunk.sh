#! sh


# svn
SVN_EXE=/cygdrive/c/Program\ Files/TortoiseSVN/bin/TortoiseProc.exe

#作業ディレクトリ
#DIRNAME=`dirname $0`
#SCRIPT_DIR=`readlink -f $DIRNAME`
#WORK_DIR=$SCRIPT_DIR
WORK_DIR=$PWD

echo $WORK_DIR

/cygdrive/c/Program\ Files/TortoiseSVN/bin/TortoiseProc.exe /command:update /path:$WORK_DIR /closeonend:2


