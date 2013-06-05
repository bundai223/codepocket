#!sh
# 渡されたテキストファイルを位置行づつ処理するサンプル
TARGET=$1


BUFIFS=$IFS
IFS=

exec 3< $TARGET
while read FL 0<&3
do
    # do something
    echo $FL
    
done
exec 3<&-

IFS=$BUFIFS

