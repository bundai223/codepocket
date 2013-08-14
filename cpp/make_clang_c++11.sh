#! bin/bash
# build C++11 sample
PROG_NAME=$1
SOURCE_NAME=$2

# make C++ source as C++11 by clang++
clang++ -std=c++11 -stdlib=libc++ -o ${PROG_NAME} ${SOURCE_NAME}

