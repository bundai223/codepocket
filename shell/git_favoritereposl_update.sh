#! sh
# 自分のリポジトリから更新するスクリプト


GIT_REPOS_ARRAY=\
(\
 ~/.vim/neobundle.vim\
 ~/github/dotfiles\
 ~/github/mysnip\
 ~/github/myvim_dict\
 ~/github/unite-outline-sources\
)
CURREND_DIR=$PWD

echo "//--------------------------------------------------------------------------------"
echo "//  git pull error log"
echo "//--------------------------------------------------------------------------------"

# echo ${GIT_REPOS_ARRAY[@]}

for dir in ${GIT_REPOS_ARRAY[@]}; do
    if [ -d $dir ]; then
        echo "**** $dir ****"
        cd $dir
        git pull
        echo ""
    fi
done

cd $CURREND_DIR

