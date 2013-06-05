#! python
# -*- coding: utf-8 -*-

import sys
from timestamp import getTimestampStr

#!
#! メイン関数
#!
if __name__=="__main__":
    argv = sys.argv
    argc = len(argv)
    
    for line in sys.stdin:
        print '\'' + line + '\''


