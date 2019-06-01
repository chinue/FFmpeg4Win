###########################################################################
#  
# ������build.sh��ʾ������,��ʾ�˵�������ı������:
# 
##########################################################################/

#���ð�װInstallĿ¼
INSTALL=$PWD/output
pkgconfig=output/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PWD/../x264/$pkgconfig:$PWD/../dav1d/$pkgconfig
echo $PKG_CONFIG_PATH
rm -rf $INSTALL
mkdir $INSTALL

#����Ŀ¼���б��밲װ
cd ffmpeg
chmod 777 configure config.sh
if test -s config.mak; then
    rm config.mak
fi

#����
./config.sh
ret=$?
if [ $ret -ne 0 ]; then
    echo "config ret=$ret"
    exit $ret
fi
#���벢��װ
make -j 8 && make install
ret=$?
if [ $ret -ne 0 ]; then
    echo "make ret=$ret"
    exit 1
fi

##������������,�������Ҫ�����Ľ���ŵ���ǰĿ¼�µ�output�м���
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
##ɾ��lib�����.a�ļ�
#find output/lib -type f ! -iname "*.a" -exec rm -rf {} \;
##ɾ��lib�����Ŀ¼
#find output/lib -type d -empty | xargs rm -rf 
##ɾ��lib������������ļ�
#find output/lib -type l -exec rm -rf {} \;

if which tree; then
    tree $INSTALL
fi
