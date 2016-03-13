project(core C CXX ASM)

file(GLOB SOURCES *.c)

add_library(core STATIC exception_vectors.S ${SOURCES} cplusplus_operators.cpp)
