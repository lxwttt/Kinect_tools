#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "k4a::k4a" for configuration "RelWithDebInfo"
set_property(TARGET k4a::k4a APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(k4a::k4a PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libk4a.so.1.4.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libk4a.so.1.4"
  )

list(APPEND _IMPORT_CHECK_TARGETS k4a::k4a )
list(APPEND _IMPORT_CHECK_FILES_FOR_k4a::k4a "${_IMPORT_PREFIX}/lib/libk4a.so.1.4.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
