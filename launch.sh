#!/usr/bin/env bash

gcc -fno-builtin -o $1 main.c
LD_PRELOAD=${PWD}/libasm.so ./$1
google-chrome-stable
