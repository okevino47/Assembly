cmake_minimum_required(VERSION 3.9)
project(ASM_minilibc_2017)

set(CMAKE_CXX_STANDARD 14)

add_executable(ASM_minilibc_2017 src/strlen.asm src/memset.asm
        src/strcmp.asm)
