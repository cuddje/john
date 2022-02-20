cmake_minimum_required(VERSION 3.6)

include(android.env.cmake)

project(andcmake)

set(distribution_dir ${CMAKE_CURRENT_BINARY_DIR}/distribution)
#set(CMAKE_LIBRARY_OUTPUT_PATH ${distribution_dir}/lib/${ANDROID_ABI})
#file(MAKE_DIRECTORY ${distribution_dir}/lib)

add_library(andcmake STATIC test.cpp)


# set(lib_build_dir ${PROJECT_BINARY_DIR}/gen/${ANDROID_ABI})
# file(MAKE_DIRECTORY ${lib_build_dir})

set_target_properties(andcmake 
                      PROPERTIES 
                      LIBRARY_OUTPUT_DIRECTORY ${distribution_dir}/lib/${ANDROID_ABI}
                      ARCHIVE_OUTPUT_DIRECTORY ${distribution_dir}/lib/${ANDROID_ABI}
                      )