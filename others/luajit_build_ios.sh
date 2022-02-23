#!/bin/bash

# LuaJIT 的源码路径
LUAJIT=.
XCODEPATH=`xcode-select -print-path`
DEVDIR=$XCODEPATH/Platforms
IOSVER=iPhoneOS.sdk
SIMVER=iPhoneSimulator.sdk
# 库的最总名称
LIBNAME=libluajit2.1.0-beta.3.a

# iOS 最低兼容版本,最好与需要嵌入 LuaJIT 的 App 的最低兼容设置保持一致.
MINVERSION=9.0
IOSDIR=$DEVDIR/iPhoneOS.platform/Developer
SIMDIR=$DEVDIR/iPhoneSimulator.platform/Developer

# xctoolchain 可以使用 xcode-select --install 命令安装.
# xctoolchain 和模拟器中, 目前已不包含 gcc 等命令,可以从系统其它位置复制到 $IOSBIN 目录.
# 命令的具体路径,可以执行 xcodebuild -find gcc 获得.
IOSBIN=$XCODEPATH/Toolchains/XcodeDefault.xctoolchain/usr/bin/
SIMBIN=$IOSDIR/usr/bin/
BUILD_DIR=$LUAJIT/build

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
rm *.a 1>/dev/null 2>/dev/null

# echo =================================================
# echo ARMV7 Architecture
# ISDKF="-arch armv7 -isysroot $IOSDIR/SDKs/$IOSVER -miphoneos-version-min=$MINVERSION"
# make -j -C $LUAJIT HOST_CC="gcc -m32 " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=armv7 TARGET_SYS=iOS clean
# make -j -C $LUAJIT HOST_CC="gcc -m32 " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=armv7 TARGET_SYS=iOS
# mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitA7.a

echo =================================================
echo ARM64 Architecture
ISDKF="-arch arm64 -isysroot $IOSDIR/SDKs/$IOSVER -miphoneos-version-min=$MINVERSION"
make -j -C $LUAJIT HOST_CC="gcc " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=arm64 TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=arm64 TARGET_SYS=iOS
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajit64bit.a 

echo =================================================
echo IOS Simulator Architecture
ISDKF="-arch x86_64 -isysroot $SIMDIR/SDKs/$SIMVER -miphoneos-version-min=$MINVERSION"
make -j -C $LUAJIT HOST_CFLAGS="-arch x86_64" HOST_LDFLAGS="-arch x86_64" TARGET_SYS=iOS TARGET=x86_64 clean
make -j -C $LUAJIT HOST_CFLAGS="-arch x86_64" HOST_LDFLAGS="-arch x86_64" TARGET_SYS=iOS TARGET=x86_64 amalg CROSS=$IOSBIN TARGET_FLAGS="$ISDKF"
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitx86_64.a

# libtool -o $BUILD_DIR/$LIBNAME $BUILD_DIR/*.a 2> /dev/null
# mkdir -p $BUILD_DIR/Headers

# cp $LUAJIT/src/lua.h $BUILD_DIR/Headers
# cp $LUAJIT/src/lauxlib.h $BUILD_DIR/Headers
# cp $LUAJIT/src/lualib.h $BUILD_DIR/Headers
# cp $LUAJIT/src/luajit.h $BUILD_DIR/Headers
# cp $LUAJIT/src/lua.hpp $BUILD_DIR/Headers
# cp $LUAJIT/src/luaconf.h $BUILD_DIR/Headers

# mv $BUILD_DIR/$LIBNAME ./lib/ios
# rm -rf $BUILD_DIR

# cd $LUAJIT
# make clean
# cd ..