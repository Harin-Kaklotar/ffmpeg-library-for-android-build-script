#!/bin/bash
NDK=/Users/arlen/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-mips64
TOOLCHAIN=$NDK/toolchains/mips64el-linux-android-4.9/prebuilt/darwin-x86_64

function build_one
{
	./configure \
	--prefix=./android/mips64 \
	--disable-static \
	--enable-shared \
	--enable-small \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=mips64 \
	--cross-prefix=$TOOLCHAIN/bin/mips64el-linux-android- \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--target-os=linux \
	--extra-cflags="-Os -fpic " \
	--disable-debug \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}

build_one
