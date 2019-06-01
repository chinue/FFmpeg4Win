###########################################################################
#  
# 这里是build.sh的示例程序,演示了第三方库的编译过程:
# 
##########################################################################/

#配置安装Install目录
INSTALL=$PWD/output
pkgconfig=output/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PWD/../x264/$pkgconfig:$PWD/../dav1d/$pkgconfig
echo $PKG_CONFIG_PATH
rm -rf $INSTALL
mkdir $INSTALL

#进入目录进行编译安装
cd ffmpeg
chmod 777 configure config.sh
if test -s config.mak; then
    rm config.mak
fi

#配置
./config.sh
ret=$?
if [ $ret -ne 0 ]; then
    echo "config ret=$ret"
    exit $ret
fi
#编译并安装
make -j 8 && make install
ret=$?
if [ $ret -ne 0 ]; then
    echo "make ret=$ret"
    exit 1
fi

##继续其他操作,把最后需要发布的结果放到当前目录下的output中即可
#cp_header_file()
#{
#    echo "mkdir -p output/include/$1/"
#    mkdir -p output/include/$1/
#    echo "cp ffmpeg/$1/*.h output/include/$1/"
#    cp ffmpeg/$1/*.h output/include/$1/
#}
#
#cd $INSTALL/..
#cp_header_file .
#cp_header_file libavcodec
#cp_header_file libavformat
#cp_header_file libavutil
#cp_header_file libavcodec/x86
#cp_header_file libpostproc
#cp_header_file libswresample
#cp_header_file libswscale
#cp_header_file libavdevice
#cp_header_file libavfilter
#cp_header_file compat
#cp_header_file libavresample
#
##删除lib下面非.a文件
#find output/lib -type f ! -iname "*.a" -exec rm -rf {} \;
##删除lib下面空目录
#find output/lib -type d -empty | xargs rm -rf 
##删除lib下面的软链接文件
#find output/lib -type l -exec rm -rf {} \;

if which tree; then
    tree $INSTALL
fi
