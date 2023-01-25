add_library(AtlArgumentParserToolInfo STATIC
  ToolInfo.swift)
# NOTE: workaround for CMake not setting up include flags yet
set_target_properties(AtlArgumentParserToolInfo PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Swift_MODULE_DIRECTORY})
target_compile_options(AtlArgumentParserToolInfo PRIVATE
  $<$<BOOL:${BUILD_TESTING}>:-enable-testing>)


set_property(GLOBAL APPEND PROPERTY AtlArgumentParser_EXPORTS AtlArgumentParserToolInfo)
