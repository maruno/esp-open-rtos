cmake_minimum_required(VERSION 3.4.1)

project(esp-open-rtos)

include_directories(
  include
  libc/xtensa-lx106-elf/include
  FreeRTOS/Source/include
  FreeRTOS/Source/portable/esp8266
  lwip/lwip/src/include
  lwip/include
  lwip/include
  lwip/lwip/src/include/posix
  lwip/lwip/src/include/ipv4
  lwip/lwip/src/include/ipv6
  lwip/lwip/src/include/ipv4/lwip
  lwip/lwip/src/include/ipv6/lwip
  lwip/lwip/src/include/lwip
  core/include
  ${LX106_HAL_BASE}/include
)

link_directories(libc/xtensa-lx106-elf/lib)

add_subdirectory(core)
add_subdirectory(FreeRTOS)
add_subdirectory(lib)
add_subdirectory(lwip)
add_subdirectory(app)
