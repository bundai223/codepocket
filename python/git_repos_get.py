#! python
# -*- coding: utf-8 -*-

import sys
import str_util


#!
#! メイン関数
#!
if __name__=="__main__":
    
    for line in sys.stdin:
        index = line.find('\"', 0)
        
        if( index != 0 ):
            surrounded = str_util.getSurrounded(line, '\'')
            print surrounded.encode('sjis')

