#! /usr/bin/env bash
# Script my typical cmake build process.

build_type=Release

mkdir -p _build && cd _build

cmake .. \
    -DCMAKE_BUILD_TYPE=$build_type \
    -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX

make -s

if test -n "$(find . -maxdepth 1 -name 'test*' -print -quit)"; then
    ctest
fi

if [ $? != 0 ]; then
    exit 1
else
    make install
fi

exit 0

