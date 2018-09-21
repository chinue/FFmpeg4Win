#!/bin/bash
#  --enable-libmp3lame \
#  --enable-shared    \

./configure --prefix=../output \
  --toolchain=msvc \
  --enable-optimizations \
  --enable-gpl          \
  --enable-version3     \
  --enable-nonfree      \
  --enable-doc          \
  --enable-ffmpeg       \
  --enable-ffprobe      \
  --disable-ffplay       \
  --enable-avfilter     \
  --disable-alsa        \
  --disable-appkit      \
  --disable-avfoundation \
  --disable-coreimage   \
  --disable-avdevice     \
  --enable-avcodec      \
  --enable-avformat     \
  --enable-swscale      \
  --enable-postproc     \
  --enable-network      \
  --extra-libs="-ldl"      \
  --extra-cflags='-I'$PWD'/../../x264/output/include -DQIANYI_TRANSCODE_OPT'  \
  --extra-ldflags='-L'$PWD'/../../x264/output/lib -lrt -gl' \
  --enable-libx264       \
  --enable-gray          \
  --disable-swscale-alpha  \
  --enable-small           \
  --enable-runtime-cpudetect \
  --enable-hardcoded-tables  \
  --enable-encoders \
  --enable-parsers \
  --enable-hwaccels \
  --enable-muxers \
  --enable-demuxers \
  --enable-bsfs \
  --enable-protocols \
  --enable-yasm \
  --arch=x86 \
  --disable-shared  \
  --enable-static

#sed -i 's/EXTRALIBS=/EXTRALIBS=-lcrypto /g' config.mak
#echo -e "ifndef QIANYI_TRANSCODE_OPT\nQIANYI_TRANSCODE_OPT=1\nendif " >> config.mak
#sed -i 's/-Werror=implicit-function-declaration -Werror=missing-prototypes//g' config.mak
