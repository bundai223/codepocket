# !sh
#=============================================
# library用のtagファイルを生成するスクリプト
#=============================================

# プロジェクトの設定
PROJECT_ROOT='~\labo\graphic\trunk'

LIBRARIES_DIR=" $PROJECT_ROOT\lib\ml"


# set env
CTAGS=ctags

TAGS_LANGMAP='--langmap=c++:+.tbl:.inl'

# create library tags file
echo "create ctags ..."
for lib_dir in $LIBRARIES_DIR; do
    
    # set lib env
    TAG_CREATE_DIR=$lib_dir
    TAG_FILE="$TAG_CREATE_DIR\tags"

    # check lang map
    # echo "check langmap ..."
    # $CTAGS -f $TAG_FILE --excmd=n -R $TAG_CREATE_DIR --list-maps=c++
    
    # create tags file
    echo " add $lib_dir"
    $CTAGS -f $TAG_FILE --excmd=n $TAGS_LANGMAP -R $TAG_CREATE_DIR
done

