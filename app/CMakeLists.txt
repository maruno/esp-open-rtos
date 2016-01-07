project(app C CXX)

set(ESP_PORT "/dev/ttyUSB0" CACHE PATH "ESP8266 serial device")
set(ESP_BAUD "115200" CACHE PATH "Serial port baudrate")

file(GLOB C_SOURCES src/*.c)
file(GLOB CXX_SOURCES src/*.cpp)

add_executable(http-rtos ${C_SOURCES} ${CXX_SOURCES})

target_link_libraries(http-rtos -Wl,--start-group core rtos lwip hal gcc c ${CMAKE_BINARY_DIR}/lib/libmain.a ${CMAKE_BINARY_DIR}/lib/libnet80211.a ${CMAKE_BINARY_DIR}/lib/libphy.a ${CMAKE_BINARY_DIR}/lib/libpp.a ${CMAKE_BINARY_DIR}/lib/libwpa.a -Wl,--end-group)

add_dependencies(http-rtos libmain.a libnet80211.a libphy.a libpp.a libwpa.a)

#set_target_properties(http-rtos PROPERTIES LINK_FLAGS "-Wl,--verbose")
set_target_properties(http-rtos PROPERTIES LINK_FLAGS "-Wl,-Map=http-rtos.map")

include_directories(../extras/cpp_support/include)

set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")

add_custom_command(TARGET http-rtos
    POST_BUILD
    COMMENT "Building firmware images"
    COMMAND rm -rf ${CMAKE_BINARY_DIR}/firmware
    COMMAND mkdir -p ${CMAKE_BINARY_DIR}/firmware
    COMMAND ${ESPTOOL} elf2image -fs 16m -fm qio -ff 40m ${CMAKE_BINARY_DIR}/app/http-rtos -o ${CMAKE_BINARY_DIR}/firmware/
)

add_custom_target(flash
    COMMENT "Flashing images"
    DEPENDS http-rtos
    #COMMAND ${ESPTOOL} -p ${ESP_PORT} --baud ${ESP_BAUD} write_flash -fs 16m -fm qio -ff 40m 0x00000 ${CMAKE_BINARY_DIR}/firmware/0x00000.bin 0x20000 ${CMAKE_BINARY_DIR}/firmware/0x20000.bin
    COMMAND ${ESPTOOL} -p ${ESP_PORT} --baud ${ESP_BAUD} write_flash -fs 8m -fm qio -ff 40m 0x00000 ${CMAKE_BINARY_DIR}/firmware/0x00000.bin 0x20000 ${CMAKE_BINARY_DIR}/firmware/0x20000.bin
)