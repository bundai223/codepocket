CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

# project name
SET(PROJECT_NAME cpp11)

SET(CMAKE_CXX_COMPILER clang++)

# src files
SET(SRC_FILES
    main.cpp
)

SET(INCLUDE_DIR
    "${CMAKE_SOURCE_DIR}"
)

#
# platform setting
#
IF(WIN32)
    MESSAGE("platform win32")

    SET(INCLUDE_DIR
        ${INCLUDE_DIR}
    )

#    SET(LINK_LIBS
#        ${FBX_ROOT}/lib/vs2010/x86/fbxsdk-2013.3-mdd.lib
#    )

#ENDIF(WIN32)
ELSEIF(APPLE)
    MESSAGE("platform apple os x")

    SET(INCLUDE_DIR
        ${INCLUDE_DIR}
    )

#    SET(LINK_LIBS
#        /System/Library/Frameworks/Carbon.framework
#    )

ELSEIF(UNIX)
    MESSAGE("platform unix")

    SET(INCLUDE_DIR
        ${INCLUDE_DIR}
    )

#    SET(LINK_LIBS
#        /System/Library/Frameworks/Carbon.framework
#    )

ENDIF(WIN32)


MESSAGE(${INCLUDE_DIR})
##MESSAGE(${LIB_DIR})
#MESSAGE(${LINK_LIBS})

INCLUDE_DIRECTORIES(${INCLUDE_DIR})
#LINK_DIRECTORIES(${LIB_DIR})


PROJECT(${PROJECT_NAME})

ADD_EXECUTABLE(${PROJECT_NAME} ${SRC_FILES})

# link lib
# 
TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${LINK_LIBS})

