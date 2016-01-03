file(GLOB_RECURSE RTOS_SOURCES Source/*.c)

add_library(rtos STATIC ${RTOS_SOURCES})
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99")
