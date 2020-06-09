###########################################################################
#  
# 这里是build.sh的示例程序,演示了第三方库的编译过程:
# 
##########################################################################/

#配置安装Install目录
INSTALL=$PWD/output64
PLATFORM=win64
export PKG_CONFIG_PATH=$PWD/external/$PLATFORM/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH
rm -rf $INSTALL
mkdir $INSTALL

pkg-config  --libs --cflags x264
pkg-config  --libs --cflags aom
#pkg-config  --libs --cflags dav1d

ff_config()
{
./configure --prefix=../output64 \
 --toolchain=msvc \
 --arch=x86_64 \
 --enable-gpl --enable-nonfree --enable-version3 --enable-small \
 --disable-network      \
 --enable-avcodec \
 --enable-avformat \
 --enable-avutil \
 --enable-swresample \
 --enable-swscale \
 --disable-avfilter \
 --enable-muxers \
 --enable-demuxers \
 --disable-encoders --enable-encoder=aac --enable-encoder=rawvideo \
 --enable-libx264 --enable-encoder=libx264 \
 --enable-libaom --enable-decoder=libaom_av1 \
 --disable-protocols --enable-protocol=file \
 --disable-bsfs --enable-bsf=h264_mp4toannexb \
 --disable-indevs \
 --disable-doc \
 --disable-outdevs --enable-ffprobe --enable-ffmpeg --enable-ffplay --disable-debug \
 --disable-shared \
 --enable-static
}

#进入目录进行编译安装
cd ffmpeg

ff_config && make -j 6 && make install
ret=$?
if [ $ret -ne 0 ]; then
    echo "make ret=$ret"
    exit 1
fi

if which tree; then
    tree $INSTALL
fi

cp $INSTALL/../external/$PLATFORM/lib/*.lib $INSTALL/lib