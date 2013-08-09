#! /bin/bash
# vimrcからpluginをcloneするシェルスクリプト

CURRENT_DIR=$PWD

DIRNAME=`dirname $0`
PATH_TO_HERE=`readlink -f $DIRNAME`
PY_DIR=${PATH_TO_HERE}/../python


REPOS_LIST=`grep NeoBundle ~/labo/dotfiles/.vimrc | python ${PY_DIR}/git_repos_get.py`

cd $1

for repos in ${REPOS_LIST}; do
	
	REPOS_NAME=`echo $repos | sed s_.*/__g`
    echo "**** ${REPOS_NAME} ****"
	if [ ! -d $REPOS_NAME ]; then
		
		git clone http://github.com/$repos
    else
        #echo "repos name : ${REPOS_NAME}"
        #echo "             ${repos}"
        cd ${REPOS_NAME}
        git pull
        cd ../
	fi
done

cd $CURRENT_DIR
