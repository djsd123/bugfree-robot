#!/usr/bin/env bash

wget https://s3-eu-west-1.amazonaws.com/digital-register/packages/Python-3.4.3.tar.xz

tar xf Python-3.4.3.tar.xz

cd Python-3.4.3

./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"

make && make altinstall