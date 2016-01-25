#!/bin/bash
NDK=/Users/arlen/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

function build_one
{
	./configure \
	--prefix=./android/armeabi-v7a \
	--disable-static \
	--enable-shared \
	--enable-small \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=arm \
	--cpu=cortex-a7 \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--target-os=linux \
	--extra-cflags="-Os -fpic -marm" \
	--extra-ldflags="-marm" \
	--disable-debug \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}

build_one