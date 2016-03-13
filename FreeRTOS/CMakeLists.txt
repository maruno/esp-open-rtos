file(GLOB_RECURSE RTOS_SOURCES Source/*.c)

add_library(rtos STATIC ${RTOS_SOURCES})
