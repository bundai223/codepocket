# !sh
#=====================================================
# project用のtagファイルを生成するスクリプト
#=====================================================

#DIRNAME=`dirname $0`
#PATH_TO_HERE=`readlink $DIRNAME`
#PROJECT_ROOT=$PATH_TO_HERE/..
PROJECT_ROOT=$PWD


# タグファイル場所
TAG_CREATE_DIR=${PROJECT_ROOT}/graphic_base
TAG_FILE="$TAG_CREATE_DIR/tags"

# ライブラリパス
TAGS_EXTEND_DIR_LIST=" ${PROJECT_ROOT}/lib/ml"
TAGS_EXTEND_DIR_LIST+=" /usr/local/include/"


# set env
CTAGS=ctags


TAGS_LANGMAP='--langmap=c++:+.tbl:.inl'


# create tag file
echo "create ctags ..."
$CTAGS -f $TAG_FILE --excmd=n $TAGS_LANGMAP -R $TAG_CREATE_DIR

# check lang map
# echo "check langmap ..."
# $CTAGS -f $TAG_FILE --excmd=n -R $TAG_CREATE_DIR --list-maps=c++


# append extend directory
echo "append extend directory ..."
for ex_dir in $TAGS_EXTEND_DIR_LIST; do
    if [ -d $ex_dir ]; then
        echo " add $ex_dir"
        $CTAGS --append=yes -f $TAG_FILE --excmd=n $TAGS_LANGMAP -R $ex_dir
    fi
done

