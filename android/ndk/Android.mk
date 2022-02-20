LOCAL_PATH := $(call my-dir)

LOCAL_C_INCLUDES := $(LOCAL_PATH) #指定头文件所在的目录

include $(CLEAR_VARS)
LOCAL_MODULE    := testndk
LOCAL_SRC_FILES := test.cpp

# 指定在构建动态库或可执行文件时需要链接的其它库列表，如Android系统提供的日志库，OpenGL ES, EGL等
# 每个链接的库文件都必须加上-l 前缀(注意是小写英文字母l,不是数字1)
# 多个链接的库文件使用空格分隔
# LOCAL_LDLIBS +=  -llog -landroid -lc

# 指定目标Android平台的名称
# APP_PLATFORM = android-26

# 是否支持C++标准库
# APP_STL := stlport_static

# 为项目中的所有C++编译传递的标记
# APP_CPPFLAGS := -frtti -fexceptions -std=c++11

include $(BUILD_SHARED_LIBRARY)