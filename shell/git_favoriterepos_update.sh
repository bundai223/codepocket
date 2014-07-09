#! /bin/bash
# 自分のリポジトリから更新するスクリプト

MY_GITHUB_DIR=~/labo/github.com/
MY_GITHUB=`ls ${MY_GITHUB_DIR} | sed "s|^|${MY_GITHUB_DIR}|"`

GIT_REPOS_ARRAY=\
(\
 ~/.vim/neobundle.vim\
 $MY_GITHUB
)
CURREND_DIR=$PWD

for dir in ${GIT_REPOS_ARRAY[@]}; do
    if [ -d $dir ]; then
        echo "**** $dir ****"
        cd $dir
        git pull
        echo ""
    fi
done

cd $CURREND_DIR

