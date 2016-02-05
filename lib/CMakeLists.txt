add_custom_target(
  libmain.a
  ALL
  COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libmain.a libmain_staging.a
  COMMAND ${XTENSA_AR} d libmain_staging.a @${CMAKE_CURRENT_SOURCE_DIR}/libmain.remove
  COMMAND ${XTENSA_OBJCOPY} --redefine-syms ${CMAKE_CURRENT_SOURCE_DIR}/allsymbols.rename --weaken libmain_staging.a libmain.a
  COMMAND ${CMAKE_RANLIB} libmain.a
  COMMAND rm libmain_staging.a
)

add_custom_target(
  libnet80211.a
  ALL
  COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libnet80211.a libnet80211_staging.a
  COMMAND ${XTENSA_AR} d libnet80211_staging.a @${CMAKE_CURRENT_SOURCE_DIR}/libnet80211.remove
  COMMAND ${XTENSA_OBJCOPY} --redefine-syms ${CMAKE_CURRENT_SOURCE_DIR}/allsymbols.rename --weaken libnet80211_staging.a libnet80211.a
  COMMAND ${CMAKE_RANLIB} libnet80211.a
  COMMAND rm libnet80211_staging.a
)

add_custom_target(
  libphy.a
  ALL
  COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libphy.a libphy_staging.a
  COMMAND ${XTENSA_AR} d libphy_staging.a @${CMAKE_CURRENT_SOURCE_DIR}/libphy.remove
  COMMAND ${XTENSA_OBJCOPY} --redefine-syms ${CMAKE_CURRENT_SOURCE_DIR}/allsymbols.rename --weaken libphy_staging.a libphy.a
  COMMAND ${CMAKE_RANLIB} libphy.a
  COMMAND rm libphy_staging.a
)

add_custom_target(
  libpp.a
  ALL
  COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libpp.a libpp_staging.a
  COMMAND ${XTENSA_AR} d libpp_staging.a @${CMAKE_CURRENT_SOURCE_DIR}/libpp.remove
  COMMAND ${XTENSA_OBJCOPY} --redefine-syms ${CMAKE_CURRENT_SOURCE_DIR}/allsymbols.rename --weaken libpp_staging.a libpp.a
  COMMAND ${CMAKE_RANLIB} libpp.a
  COMMAND rm libpp_staging.a
)

add_custom_target(
  libwpa.a
  ALL
  COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/libwpa.a libwpa_staging.a
  COMMAND ${XTENSA_AR} d libwpa_staging.a @${CMAKE_CURRENT_SOURCE_DIR}/libwpa.remove
  COMMAND ${XTENSA_OBJCOPY} --redefine-syms ${CMAKE_CURRENT_SOURCE_DIR}/allsymbols.rename --weaken libwpa_staging.a libwpa.a
  COMMAND ${CMAKE_RANLIB} libwpa.a
  COMMAND rm libwpa_staging.a
)
