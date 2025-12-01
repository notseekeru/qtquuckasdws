# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appqtquucj_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appqtquucj_autogen.dir\\ParseCache.txt"
  "appqtquucj_autogen"
  )
endif()
