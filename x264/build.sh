###########################################################################
#  
# 这里是build.sh的示例程序,演示了第三方库的编译过程:
# 
##########################################################################/

#配置安装Install目录
INSTALL=$PWD/output

#进入目录进行编译安装
cd x264
chmod 777 configure config.sub config.guess version.sh
if test -s config.mak; then
    rm config.mak
fi

#配置
CC=cl ./configure  --enable-static --disable-opencl --prefix=$INSTALL

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
    exit $ret
fi

#继续其他操作,把最后需要发布的结果放到当前目录下的output中即可
#rm -rf output
#mkdir output
#cp -r $INSTALL/include output
#cp -r $INSTALL/lib output
#cp -r $INSTALL/bin output

#if test -s README; then
#    cp README output/
#fi
#
#if test -s ChangeLog; then
#    cp ChangeLog output/
#fi

if which tree; then
    tree $INSTALL
fi
