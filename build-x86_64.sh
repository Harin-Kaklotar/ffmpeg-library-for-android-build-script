#!/bin/bash
NDK=/Users/arlen/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-arm64
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/darwin-x86_64

function build_one
{
  ./configure \
  --prefix=./android/x86_64 \
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
  --cross-prefix=$TOOLCHAIN/bin/x86_64-linux-android- \
  --target-os=linux \
  --arch=x86_64 \
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