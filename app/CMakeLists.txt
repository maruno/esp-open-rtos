project(example-project)

add_executable(blink blink.c)

target_link_libraries(blink -Wl,--start-group core rtos lwip hal gcc c ${CMAKE_BINARY_DIR}/lib/libmain.a ${CMAKE_BINARY_DIR}/lib/libnet80211.a ${CMAKE_BINARY_DIR}/lib/libphy.a ${CMAKE_BINARY_DIR}/lib/libpp.a ${CMAKE_BINARY_DIR}/lib/libwpa.a -Wl,--end-group)

add_dependencies(blink libmain.a libnet80211.a libphy.a libpp.a libwpa.a)

set_target_properties(blink PROPERTIES LINK_FLAGS "-Wl,--verbose")
