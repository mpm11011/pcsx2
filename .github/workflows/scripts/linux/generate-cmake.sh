#!/bin/bash

set -e

if [ "${COMPILER}" = "gcc" ]; then
  export CC=gcc
  export CXX=g++
else
  export CC=clang
  export CXX=clang++
fi
ADDITIONAL_CMAKE_ARGS=""
if [ "${PLATFORM}" = "x86" ]; then
  ADDITIONAL_CMAKE_ARGS="-D CMAKE_TOOLCHAIN_FILE=cmake/linux-compiler-i386-multilib.cmake"
fi
echo "Additional CMake Args - ${ADDITIONAL_CMAKE_ARGS}"

# Generate CMake into ./build
cmake \
-D CMAKE_BUILD_TYPE=Release \
-D BUILD_REPLAY_LOADERS=TRUE \
-D CMAKE_BUILD_PO=FALSE \
-D GTK3_API=TRUE ${ADDITIONAL_CMAKE_ARGS} \
-B build
