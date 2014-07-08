#! python
# -*- coding: utf-8 -*-

import os
import time

def getAccessTime(stat):
    return stat.st_atime

# ???
def getCTime(stat):
    return stat.st_ctime

def getModifyTime(stat):
    return stat.st_mtime

def getCreateTime(stat):
    return stat.st_birthtime


def getTime(stat):
    return getCreateTime(stat)

def getTimeYear(filename):
    updatetime = getTime(os.stat(filename))
    mtime = time.gmtime(updatetime)
    return str(mtime[0]).rjust(4,'0')

def getTimeMonth(filename):
    updatetime = getTime(os.stat(filename))
    mtime = time.gmtime(updatetime)
    return str(mtime[1]).rjust(2,'0')

def getTimeDay(filename):
    updatetime = getTime(os.stat(filename))
    mtime = time.gmtime(updatetime)
    return str(mtime[2]).rjust(2,'0')

def getTimeHour(filename):
    updatetime = getTime(os.stat(filename))
    mtime = time.gmtime(updatetime)
    return str(mtime[3]).rjust(2,'0')

def getTimeMin(filename):
    updatetime = getTime(os.stat(filename))
    mtime = time.gmtime(updatetime)
    return str(mtime[4]).rjust(2,'0')

def getTimeSec(filename):
    updatetime = getTime(os.stat(filename))
    mtime = time.gmtime(updatetime)
    return str(mtime[5]).rjust(2,'0')

def getTimestampStr(filename):
    yyyy = getTimeYear(filename)
    mm   = getTimeMonth(filename)
    dd   = getTimeDay(filename)
    hour = getTimeHour(filename)
    mini = getTimeMin(filename)
    sec  = getTimeSec(filename)
    
    return yyyy + mm + dd + '_' + hour + mini + sec

