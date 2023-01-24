#!/bin/bash

cd espresso
mkdir build
cd build
cmake ..
make -j$(nproc)