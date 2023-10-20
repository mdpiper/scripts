#! /usr/bin/env bash
# Script my typical cmake build process.

build_type=Release
build_dir=_build

if [ -e $build_dir ]; then rm -r $build_dir; fi
mkdir $build_dir && cd $build_dir

cmake .. \
    -DCMAKE_BUILD_TYPE=$build_type \
    -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX

make -s
if [ $? != 0 ]; then exit 1; fi

if test -n "$(find . -maxdepth 1 -name 'test*' -print -quit)"; then
    ctest
fi

if [ $? != 0 ]; then
    exit 1
else
    make install
fi

exit 0

