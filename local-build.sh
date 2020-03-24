#! /usr/bin/env bash
# Script my typical cmake build process.

mkdir -p _build && cd _build
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX
make -s
ctest
if [ $? != 0 ]; then
    exit 1
else
    make install
fi
exit 0

