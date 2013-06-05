#! python
# -*- coding: utf-8 -*-

import os
import sys


#!
#! グレップする関数
#!
def grep_str(filename, grepstr):
    f = open(filename)
    filestr = unicode(f.read(), 'utf-8')
    f.close()
    
    fixedfilestr = filestr.replace(u'\r',u'\n')
    lines = fixedfilestr.split('\n')
    
    for line in lines:
        index = line.find(unicode(grepstr, 'sjis'), 0)
        
        if (index != -1):
            print line
            

#!
#! 指定文字で囲まれた部分の文字列を返す
#! 囲まれた部分がなければ空配列を返す
#!
def getScissored(srcstr, begin, end):
    start_index = srcstr.find(begin, 0)
    last_index  = srcstr.find(end, start_index+1)
    
    if( start_index != -1):
        if( last_index != -1):
            tmp = srcstr.partition(begin)[2]
            surrounded = tmp.partition(end)[0]
            
            return surrounded
    
    return {}

def getSurrounded(srcstr, sep):
    return getScissored(srcstr, sep, sep);

#!
#! スクリプトの絶対パスを求める
#!
def getScriptPath():
   print __file__                                    # スクリプトの相対パス
   print os.path.basename(__file__)                  # スクリプト名
   print os.path.abspath(__file__)                   # スクリプトの絶対パス
   print os.path.abspath(os.path.dirname(__file__))  # スクリプトあるディレクトリの絶対パス
   print os.getcwd()                                 # 実行時カレントディレクトリの絶対パス
