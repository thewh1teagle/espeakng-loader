#!/bin/bash

cd espeak-ng

# Dynamic archive
cmake -B build -DBUILD_SHARED_LIBS=ON -DENABLE_TESTS=OFF -DCOMPILE_INTONATIONS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_dynamic . $EXTRA_CMAKE_ARGS
cmake --build build --config Release
cmake --install build

# Static archive (not for Windows)
# if [[ ! "$(uname -s)" =~ MINGW|MSYS|CYGWIN ]]; then
#     cmake -B build -DBUILD_SHARED_LIBS=OFF -DENABLE_TESTS=OFF -DCOMPILE_INTONATIONS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_static . $EXTRA_CMAKE_ARGS
#     cmake --build build --config Release
#     cmake --install build
# fi

# Remove unnecessary files
rm -rf _dynamic/share


# Package for Windows
if [[ "$(uname -s)" =~ MINGW|MSYS|CYGWIN ]]; then
    cp _dynamic/bin/espeak-ng.dll _dynamic/lib
    rm -rf _dynamic/lib/pkgconfig
    mv _dynamic espeak-ng-libs
else
    # Package for Unix
    # cp _static/lib/libespeak-ng.a _dynamic/lib
    # Package the libraries
    mv _dynamic espeak-ng-libs
fi

# Show package contents
echo "Package Contents:"
echo "================="
tree espeak-ng-libs 2>/dev/null || echo "Unable to display contents. Make sure the 'tree' command is installed."

# Create the tarball
tar -czf espeak-ng-libs.tar.gz espeak-ng-libs
echo "espeak-ng-libs.tar.gz created"