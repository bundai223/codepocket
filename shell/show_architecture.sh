#! /usr/local/bin/zsh
_uname=`uname -m`
_arch=`arch`
_getconf=`getconf LONG_BIT`

declare -p _uname
declare -p _arch
declare -p _getconf

