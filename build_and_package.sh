#!/bin/bash

set -e
set -x

mkdir build
cd build
../configure --prefix=$PWD/install/
make -j "$(nproc)" CFLAGS="-U_FORTIFY_SOURCE -O3"
make install

cd install
tar -czf ../glibc-$(git rev-parse --abbrev-ref HEAD).tar.gz ./
