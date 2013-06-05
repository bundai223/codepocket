# !sh
#=====================================================
# project用のtagファイルを生成するスクリプト
#=====================================================
CURRENT=$PWD

DIRNAME=`dirname $0`
PATH_TO_HERE=`readlink -f $DIRNAME`
PROJECT_ROOT=`cygpath -w $PATH_TO_HERE/..`

TAG_CREATE_DIR=${PROJECT_ROOT}proj


cd $TAG_CREATE_DIR
gtags -v

# 元の場所に戻す
cd $PWD

