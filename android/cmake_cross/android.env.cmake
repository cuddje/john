set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 21)
set(CMAKE_ANDROID_NDK "$ENV{NDK_ROOT}")
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_ANDROID_NDK}/build/cmake/android.toolchain.cmake)
set(CMAKE_ANDROID_STL_TYPE gnustl_static)
#set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)
#set(CMAKE_ANDROID_ABI arm64-v8a)
set(ANDROID_ABI x86_64) #https://developer.android.google.cn/ndk/guides/cmake#command-line_2 google文档中要求ANDROID_ABI
