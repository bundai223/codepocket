#!sh
# ファイルのタイムスタンプを取得する処理

TARGET=$1



TIMESTAMP=`ls -lrt --time-style='+%Y%m%d_%H%M%S' ${TARGET} | awk '{print $6}'`
echo $TIMESTAMP

