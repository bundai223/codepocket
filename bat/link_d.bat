@echo off

set CURRENT=%CD%
set DST=%1
set SRC=%2

mklink /d %CURRENT%\%DST% %CURRENT%\%SRC%
