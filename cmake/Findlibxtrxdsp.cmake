
if(NOT LIBXTRXDSP_FOUND)
	if(NOT WIN32)
		include(FindPkgConfig)
		pkg_check_modules (LIBXTRXDSP_PKG libxtrxdsp)
	endif(NOT WIN32)

	find_path(LIBXTRXDSP_INCLUDE_DIRS NAMES xtrxdsp.h
		PATHS
		${LIBXTRXDSP_PKG_INCLUDE_DIRS}
		/usr/include
		/usr/local/include
		)

	find_library(LIBXTRXDSP_LIBRARIES NAMES xtrxdsp
		PATHS
		${LIBXTRXDSP_PKG_LIBRARY_DIRS}
		/usr/lib
		/usr/local/lib
		)

	if(LIBXTRXDSP_INCLUDE_DIRS AND LIBXTRXDSP_LIBRARIES)
		set(LIBXTRXDSP_FOUND TRUE CACHE INTERNAL "libxtrxdsp found")
		message(STATUS "Found libxtrxdsp: ${LIBXTRXDSP_INCLUDE_DIRS}, ${LIBXTRXDSP_LIBRARIES}")
	else(LIBXTRXDSP_INCLUDE_DIRS AND LIBXTRXDSP_LIBRARIES)
		set(LIBXTRXDSP_FOUND FALSE CACHE INTERNAL "libxtrxdsp found")
		message(STATUS "libxtrxdsp not found.")
	endif(LIBXTRXDSP_INCLUDE_DIRS AND LIBXTRXDSP_LIBRARIES)

	mark_as_advanced(LIBXTRXDSP_LIBRARIES LIBXTRXDSP_INCLUDE_DIRS)

endif(NOT LIBXTRXDSP_FOUND)
