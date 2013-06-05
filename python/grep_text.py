#! python
# -*- coding: utf-8 -*-

import sys
import str_util

#!
#! メイン関数
#!
if __name__=="__main__":
    argv = sys.argv
    argc = len(argv)
    
    if (3 == argc):
        input_file = argv[1]
        search_str = argv[2]
        
        str_util.grep_str(input_file, search_str)
    else:
        print 'error argment'
        print 'grep_text.py [input file name] [grep string]'
    

