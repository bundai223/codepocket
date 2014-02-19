#! /bin/bash
# 自分のリポジトリから更新するスクリプト


GIT_REPOS_ARRAY=\
(\
 ~/.vim/neobundle.vim\
 ~/labo/dotfiles\
 ~/labo/vim/mysnip\
 ~/labo/vim/myvim_dict\
 ~/labo/vim/unite-outline-sources\
 ~/labo/vim/unite-picktodo\
 ~/labo/codepocket\
 ~/labo/playground\
 ~/labo/personal_tips\
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

