#!/bin/bash
NDK=/Users/arlen/Library/Android/sdk/ndk-bundle

function build_armeabi
{
	./configure \
	--prefix=./android/armeabi \
	--disable-static \
	--enable-shared \
	--enable-small \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=arm \
	--cpu=arm926ej-s \
	--cross-prefix=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi- \
	--enable-cross-compile \
	--sysroot=$NDK/platforms/android-21/arch-arm \
	--target-os=linux \
	--extra-cflags="-Os -fpic -marm" \
	--extra-ldflags="-marm" \
	--disable-debug \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}

function build_armeabi-v7a
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
	--cross-prefix=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi- \
	--enable-cross-compile \
	--sysroot=$NDK/platforms/android-21/arch-arm \
	--target-os=linux \
	--extra-cflags="-Os -fpic -marm" \
	--extra-ldflags="-marm" \
	--disable-debug \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}

function build_arm64-v8a
{
	./configure \
	--prefix=./android/arm64-v8a \
	--disable-static \
	--enable-shared \
	--enable-small \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffserver \
	--disable-doc \
	--arch=arm64 \
	--cpu=cortex-a53 \
	--cross-prefix=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android- \
	--enable-cross-compile \
	--sysroot=$NDK/platforms/android-21/arch-arm64 \
	--target-os=linux \
	--extra-cflags="-Os -fpic" \
	--disable-debug \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j8
	make install
}




