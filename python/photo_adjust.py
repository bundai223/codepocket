#! /usr/bin/python
# -*- coding: utf-8 -*-

# python labo/codepocket/python/photo_adjust.py ~/test/out ~/test .jpg
import os
import sys
import glob
import shutil
from timestamp import getTimestampStr
from timestamp import getTimeYear
from timestamp import getTimeMonth

def echo_usage():
    print "----------------------------------------"
    print "this is file sorting program."
    print "sorting and rename files in target directory."
    print "* usage *"
    print "python photo_adjust.py [output_path] [target_path] [target ext]"
    print "----------------------------------------"

#!
#! メイン関数
#!
if __name__=="__main__":
    argv = sys.argv
    argc = len(argv)

    if argc < 4:
        echo_usage()
        sys.exit()

    dstdir = argv[1]
    target_pattern = argv[2]
    target_suffix = argv[3]

    # 出力ディレクトリ生成
    if os.path.exists(dstdir) == False:
        os.mkdir(dstdir)
    
    for srcfilepath  in glob.glob(target_pattern + "*" + target_suffix):
        outdir = dstdir + "/" + getTimeYear(srcfilepath) + getTimeMonth(srcfilepath)
        outfilepath = outdir + "/" + getTimestampStr(srcfilepath) + target_suffix
        #print srcfilepath + " : " + outfilepath

        # 出力ディレクトリ生成
        if os.path.exists(outdir) == False:
            os.mkdir(outdir)
        # 同名ファイルがあればなにもできない。
        if os.path.exists(outfilepath):
            print("同名ファイルがあります。: " + outfilepath)
        else:
            shutil.copyfile(srcfilepath, outfilepath)
    
#    print getTimestampStr(argv[0])

