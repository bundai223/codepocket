#! python
# -*- coding: utf-8 -*-

import os
import time

def getTimeYear(filename):
    updatetime = os.stat(filename).st_mtime
    mtime = time.gmtime(updatetime)
    return str(mtime[0]).rjust(4,'0')

def getTimeMonth(filename):
    updatetime = os.stat(filename).st_mtime
    mtime = time.gmtime(updatetime)
    return str(mtime[1]).rjust(2,'0')

def getTimeDay(filename):
    updatetime = os.stat(filename).st_mtime
    mtime = time.gmtime(updatetime)
    return str(mtime[2]).rjust(2,'0')

def getTimeHour(filename):
    updatetime = os.stat(filename).st_mtime
    mtime = time.gmtime(updatetime)
    return str(mtime[3]).rjust(2,'0')

def getTimeMin(filename):
    updatetime = os.stat(filename).st_mtime
    mtime = time.gmtime(updatetime)
    return str(mtime[4]).rjust(2,'0')

def getTimeSec(filename):
    updatetime = os.stat(filename).st_mtime
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

