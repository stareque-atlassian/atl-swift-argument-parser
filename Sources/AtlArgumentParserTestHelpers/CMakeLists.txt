add_library(AtlArgumentParserTestHelpers
  StringHelpers.swift
  TestHelpers.swift)
set_target_properties(AtlArgumentParserTestHelpers PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Swift_MODULE_DIRECTORY})
target_link_libraries(AtlArgumentParserTestHelpers PUBLIC
  AtlArgumentParser
  XCTest
  Foundation)
