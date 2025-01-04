#!/bin/bash

cd espeak-ng

# Static archive
cmake -B build -DBUILD_SHARED_LIBS=OFF -DENABLE_TESTS=OFF -DCOMPILE_INTONATIONS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_static .
cmake --build build
cmake --install build

# Dynamic archive
cmake -B build -DBUILD_SHARED_LIBS=ON -DENABLE_TESTS=OFF -DCOMPILE_INTONATIONS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_dynamic .
cmake --build build
cmake --install build

# Remove unnecessary files
rm -rf _dynamic/share
# Copy the static library to the dynamic library
cp _static/lib/libespeak-ng.a _dynamic/lib
# Package the libraries
mv _dynamic espeak-ng-libs
tar -czf espeak-ng-libs.tar.gz espeak-ng-libs

echo "espeak-ng-libs.tar.gz created"