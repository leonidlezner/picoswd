#!/bin/bash

export PICO_SDK_PATH="../pico-sdk"

mkdir -p build_release

cd ./build_release

cmake -B./. -S../. -DCMAKE_BUILD_TYPE=Release

make