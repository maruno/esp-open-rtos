include(CMakeForceCompiler)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR esp8266)

set(TOOLCHAIN_DIR "/opt/xtensa-example" CACHE PATH "Toolchain location")

find_program(XTENSA_CC xtensa-lx106-elf-gcc
    ${TOOLCHAIN_DIR}/bin
    )
find_program(XTENSA_CXX xtensa-lx106-elf-g++
    ${TOOLCHAIN_DIR}/bin
    )
find_program(XTENSA_AS xtensa-lx106-elf-as
    ${TOOLCHAIN_DIR}/bin
    )
find_program(XTENSA_OBJCOPY xtensa-lx106-elf-objcopy
    ${TOOLCHAIN_DIR}/bin
    )
find_program(XTENSA_AR xtensa-lx106-elf-ar
    ${TOOLCHAIN_DIR}/bin
)
find_program(XTENSA_SIZE_TOOL xtensa-lx106-elf-size
    ${TOOLCHAIN_DIR}/bin
)
find_program(ESPTOOL esptool.py
    ${TOOLCHAIN_DIR}/bin
)

CMAKE_FORCE_C_COMPILER(${XTENSA_CC} GNU)
CMAKE_FORCE_CXX_COMPILER(${XTENSA_CXX} GNU)

set(COMMON_C_CXX_FLAGS "-Wall -Werror -nostdlib -mlongcalls -mtext-section-literals -ffunction-sections -fdata-sections")

set(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS}"
    "${COMMON_C_CXX_FLAGS}"
)

set(CMAKE_CXX_FLAGS
    #"${CMAKE_C_FLAGS}"
    "${CMAKE_CXX_FLAGS}"
    "${COMMON_C_CXX_FLAGS}"
    "-fno-exceptions -fno-rtti"
)

set(CMAKE_ASM_FLAGS
    "${CMAKE_ASM_FLAGS}"
    "${COMMON_C_CXX_FLAGS}"
)

set(CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS}"
    "-nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static -Wl,-gc-sections"
    "-T${CMAKE_SOURCE_DIR}/ld/nonota.ld -T${CMAKE_SOURCE_DIR}/ld/common.ld -T${CMAKE_SOURCE_DIR}/ld/rom.ld"
)

set(CMAKE_C_FLAGS_RELEASE "-g -O2")
#set(CMAKE_C_FLAGS_RELEASE "-Os")
set(CMAKE_CXX_FLAGS_RELEASE "-g -O2")
#set(CMAKE_CXX_FLAGS_RELEASE "-Os")
set(CMAKE_ASM_FLAGS_RELEASE "-g -O2")
#set(CMAKE_ASM_FLAGS_RELEASE "-Os")
set(CMAKE_C_FLAGS_DEBUG "-g -O0")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")
set(CMAKE_ASM_FLAGS_DEBUG "-g -O0")

# fix long strings (CMake appends semicolons)
string(REGEX REPLACE ";" " " CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
string(REGEX REPLACE ";" " " CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
string(REGEX REPLACE ";" " " CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}")
string(REGEX REPLACE ";" " " CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "")

set(BUILD_SHARED_LIBS OFF)
