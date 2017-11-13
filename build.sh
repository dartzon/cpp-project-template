#!/bin/bash

# Use clang instead for gcc
export CC=clang
export CXX=clang++

CMAKELIST_DIR=$(pwd)

BUILD_DIR=build/
mkdir -p $BUILD_DIR
cd $BUILD_DIR

case "$1" in

    -clean)
	rm CMakeCache.txt
	;;

    -test)
	cmake -G "Unix Makefiles" "$CMAKELIST_DIR" -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DBUILD_TESTS=ON
	;;

    *)
	cmake -G "Unix Makefiles" "$CMAKELIST_DIR" -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DBUILD_TESTS=OFF
	;;

esac

# Compile command
make -j8
