project(core C CXX ASM)

file(GLOB SOURCES *.c)

add_library(core STATIC exception_vectors.S ${SOURCES} cplusplus_operators.cpp)

set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS} -fno-exceptions -fno-rtti")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99")
