#!/bin/bash
#  --enable-libmp3lame \
#  --enable-shared    \
#!/bin/sh
./configure --prefix=../output \
 --toolchain=msvc \
 --enable-gpl --enable-nonfree --enable-version3 --enable-small \
 --disable-network      \
 --enable-avcodec \
 --enable-avformat \
 --enable-avutil \
 --enable-swresample \
 --enable-swscale \
 --enable-avfilter \
 --disable-muxers --enable-muxer=mov --enable-muxer=mp4 --enable-muxer=avi --enable-muxer=rawvideo \
 --disable-demuxers --enable-demuxer=h264 --enable-demuxer=avi --enable-demuxer=mpc --enable-demuxer=mov --enable-demuxer=rawvideo --enable-demuxer=flv --enable-demuxer=data --enable-demuxer=mpegts \
 --disable-encoders --enable-encoder=aac --enable-encoder=rawvideo \
 --enable-libx264 --enable-encoder=libx264 \
 --disable-filters --enable-filter=anull --enable-filter=null --enable-filter=aresample --enable-filter=pad --enable-filter=scale --enable-filter=overlay --enable-filter=rotate --enable-filter=amix --enable-filter=aresample \
 --disable-protocols --enable-protocol=file \
 --disable-bsfs --enable-bsf=h264_mp4toannexb \
 --disable-indevs \
 --disable-doc \
 --disable-outdevs --enable-ffprobe --enable-ffmpeg --enable-ffplay --disable-debug \
 --disable-shared \
 --enable-static
# --enable-libdav1d --enable-decoder=libdav1d \
# --disable-parsers --enable-parser=h264 \
# --disable-decoders --enable-decoder=aac --enable-decoder=aac_latm --enable-decoder=h264 \

# ./configure --prefix=../output \
# --toolchain=msvc \
  # --enable-optimizations \
  # --enable-gpl          \
  # --enable-version3     \
  # --enable-nonfree      \
  # --enable-doc          \
  # --enable-ffmpeg       \
  # --enable-ffprobe      \
  # --disable-ffplay       \
  # --enable-avfilter     \
  # --disable-alsa        \
  # --disable-appkit      \
  # --disable-avfoundation \
  # --disable-coreimage   \
  # --disable-avdevice     \
  # --enable-avcodec      \
  # --enable-avformat     \
  # --enable-swscale      \
  # --enable-postproc     \
  # --disable-network      \
  # --extra-libs="-ldl"      \
  # --extra-cflags='-I'$PWD'/../../lame/output/include -I'$PWD'/../../x264/output/include -I'$PWD'/../.. -DQIANYI_TRANSCODE_OPT'  \
  # --extra-ldflags='-L'$PWD'/../../lame/output/lib -L'$PWD'/../../x264/output/lib -lrt -gl' \
  # --enable-libx264       \
  # --enable-gray          \
  # --disable-swscale-alpha  \
  # --enable-small           \
  # --enable-runtime-cpudetect \
  # --enable-hardcoded-tables  \
  # --enable-encoders \
  # --enable-parsers \
  # --enable-hwaccels \
  # --enable-muxers \
  # --enable-demuxers \
  # --enable-bsfs \
  # --enable-protocols \
  # --enable-x86asm \
  # --arch=x86 \
  # --enable-w32threads \
  # --disable-shared  \
  # --enable-static \
  # --samples=/home/bingo/ffmpeg/samples

#sed -i 's/EXTRALIBS=/EXTRALIBS=-lcrypto /g' config.mak
#echo -e "ifndef QIANYI_TRANSCODE_OPT\nQIANYI_TRANSCODE_OPT=1\nendif " >> config.mak
#sed -i 's/-Werror=implicit-function-declaration -Werror=missing-prototypes//g' config.mak
