set(AtlArgumentParser_EXPORTS_FILE ${CMAKE_CURRENT_BINARY_DIR}/AtlArgumentParserExports.cmake)

 configure_file(AtlArgumentParserConfig.cmake.in
   ${CMAKE_CURRENT_BINARY_DIR}/AtlArgumentParserConfig.cmake)

 get_property(AtlArgumentParser_EXPORTS GLOBAL PROPERTY AtlArgumentParser_EXPORTS)
 export(TARGETS ${AtlArgumentParser_EXPORTS}
   FILE ${AtlArgumentParser_EXPORTS_FILE})
