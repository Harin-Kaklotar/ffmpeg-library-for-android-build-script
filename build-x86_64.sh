#!/bin/bash
NDK=/Users/arlen/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-x86_64
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/darwin-x86_64

function build_one
{
  ./configure \
  --prefix=./android/x86_64 \
  --disable-static \
  --enable-shared \
  --enable-small \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-doc \
  --disable-yasm \
  --arch=x86_64 \
  --cross-prefix=$TOOLCHAIN/bin/x86_64-linux-android- \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --target-os=linux \
  --extra-cflags="-Os -fpic" \
  --disable-debug \
  $ADDITIONAL_CONFIGURE_FLAG
  make clean
  make -j8
  make install
}

build_one