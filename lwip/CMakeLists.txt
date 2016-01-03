file(GLOB API_SOURCES lwip/src/api/*.c)
file(GLOB CORE_SOURCES lwip/src/core/*.c)
file(GLOB CORE_IPv4_SOURCES lwip/src/core/ipv4/*.c)
file(GLOB NETIF_SOURCES lwip/src/netif/*.c)

add_library(lwip STATIC sys_arch.c esp_interface.c ${API_SOURCES} ${CORE_SOURCES} ${CORE_IPv4_SOURCES} ${NETIF_SOURCES})
set_target_properties(lwip PROPERTIES COMPILE_FLAGS "-std=gnu99 -Wno-address")
