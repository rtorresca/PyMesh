SET(DEPENDENT_LIBS "")

# Find tetgen
IF (TETGEN_FOUND)
    INCLUDE_DIRECTORIES(${TETGEN_INCLUDE_DIRS})
    LIST(APPEND DEPENDENT_LIBS ${TETGEN_LIBRARIES})
    ADD_DEFINITIONS(-DTETLIBRARY)
ELSE (TETGEN_FOUND)
    MESSAGE(FATAL_ERROR "tetgen is required by tetgen_wrapper and PyTetgen")
ENDIF (TETGEN_FOUND)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

# Enumerate source files
FILE(GLOB_RECURSE SRC_FILES *.cpp)
FILE(GLOB_RECURSE INC_FILES *.h)

ADD_LIBRARY(lib_tetgen_wrapper SHARED ${SRC_FILES} ${INC_FILES})
SET_TARGET_PROPERTIES(lib_tetgen_wrapper PROPERTIES OUTPUT_NAME "tetgen_wrapper")
TARGET_LINK_LIBRARIES(lib_tetgen_wrapper Mesh ${DEPENDENT_LIBS})

IF(NOT WITHOUT_SWIG)
    set(SWG_FILES PyTetgen.i)

    # Generate wrapper for python
    SET_SOURCE_FILES_PROPERTIES(${SWG_FILES} PROPERTIES CPLUSPLUS ON)
    SET_SOURCE_FILES_PROPERTIES(${SWG_FILES} PROPERTIES CMAKE_SWIG_FLAGS "-includeall")
    SWIG_ADD_MODULE(PyTetgen python ${SWG_FILES} ${INC_FILES})
    SWIG_LINK_LIBRARIES(PyTetgen ${PYTHON_LIBRARIES} Mesh lib_tetgen_wrapper)

    # Boudle exe, lib, swig wrapper into a single target.
    # To build all 3, one can just "make selfintersect"
    # Note the swig target is the autogenerated _PySelfintersect
    # instead of PySelfintersect.
    ADD_CUSTOM_TARGET(tetgen DEPENDS lib_tetgen_wrapper _PyTetgen)
ELSE(NOT WITHOUT_SWIG)
    ADD_CUSTOM_TARGET(tetgen DEPENDS lib_tetgen_wrapper)
ENDIF(NOT WITHOUT_SWIG)
