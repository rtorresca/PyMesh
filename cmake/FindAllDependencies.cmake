############################ REQUIRED PACKAGES #################################

# Include Eigen
IF (NOT EIGNE_FOUND)
    FIND_PACKAGE(Eigen REQUIRED)
ENDIF (NOT EIGNE_FOUND)

# Python
IF (NOT PYTHON_FOUND)
    FIND_PACKAGE(PythonLibs REQUIRED)
ENDIF (NOT PYTHON_FOUND)

# Numpy
IF (NOT NUMPY_FOUND)
    FIND_PACKAGE(NumPy REQUIRED)
ENDIF (NOT NUMPY_FOUND)

# Swig
IF (NOT SWIG_FOUND)
    FIND_PACKAGE(SWIG REQUIRED)
ENDIF (NOT SWIG_FOUND)

############################ OPTIONAL PACKAGES #################################

# OpenCL
IF (NOT OPENCL_FOUND)
    FIND_PACKAGE(OpenCL)
ENDIF (NOT OPENCL_FOUND)

# SpraseHash
IF (NOT SPARSEHAHS_FOUND)
    FIND_PACKAGE(SparseHash)
ENDIF (NOT SPARSEHAHS_FOUND)

# Boost
IF (NOT Boost_FOUND)
    FIND_PACKAGE(Boost)
ENDIF (NOT Boost_FOUND)

# CGAL
IF (NOT CGAL_FOUND)
    IF (DEFINED ENV{CGAL_PATH} AND NOT DEFINED ENV{CGAL_DIR})
        SET(CGAL_DIR $ENV{CGAL_PATH})
    ENDIF (DEFINED ENV{CGAL_PATH} AND NOT DEFINED ENV{CGAL_DIR})
    FIND_PACKAGE(CGAL)
ENDIF (NOT CGAL_FOUND)

# GMP
IF (NOT GMP_FOUND)
    FIND_PACKAGE(GMP)
ENDIF (NOT GMP_FOUND)

# Qhull
IF (NOT QHULL_FOUND)
    IF (DEFINED ENV{QHULL_PATH})
        SET(QHULL_ROOT $ENV{QHULL_PATH})
    ENDIF (DEFINED ENV{QHULL_PATH})
    FIND_PACKAGE(Qhull)
ENDIF (NOT QHULL_FOUND)

# Triangle
IF (NOT TRIANGLE_FOUND)
    FIND_PACKAGE(Triangle)
ENDIF (NOT TRIANGLE_FOUND)

# Tetgen
IF (NOT TETGEN_FOUND)
    FIND_PACKAGE(Tetgen)
ENDIF (NOT TETGEN_FOUND)

# Cork
IF (NOT CORK_FOUND)
    FIND_PACKAGE(Cork)
ENDIF(NOT CORK_FOUND)

# Clipper
IF (NOT CLIPPER_FOUND)
    FIND_PACKAGE(Clipper)
ENDIF (NOT CLIPPER_FOUND)

# libigl
IF (NOT LIBIGL_FOUND)
    FIND_PACKAGE(libigl)
ENDIF (NOT LIBIGL_FOUND)

# Carve
IF (NOT CARVE_FOUND)
    FIND_PACKAGE(Carve)
ENDIF (NOT CARVE_FOUND)

# SuiteSparse
IF (NOT UMFPACK_FOUND)
    FIND_PACKAGE(Umfpack)
ENDIF (NOT UMFPACK_FOUND)

# Cholmod
IF (NOT CHOLMOD_FOUND)
    FIND_PACKAGE(Cholmod)
ENDIF (NOT CHOLMOD_FOUND)

# Metis
IF (NOT METIS_FOUND)
    FIND_PACKAGE(Metis)
ENDIF (NOT METIS_FOUND)
