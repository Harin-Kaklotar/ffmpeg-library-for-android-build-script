#!/bin/bash
NDK=/Users/arlen/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

CPU=armeabi
PREFIX=./android/$CPU
ADDI_CFLAGS="-marm"

function build_one
{
	./configure \
	--prefix=$PREFIX \
	--enable-shared \
	--disable-static \
	--disable-doc \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--disable-symver \
	--enable-small \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--target-os=linux \
	--arch=arm \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
	--extra-ldflags="$ADDI_LDFLAGS" \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j4
	make install
}

build_one