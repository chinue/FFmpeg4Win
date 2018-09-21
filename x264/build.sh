###########################################################################
#  
# ������build.sh��ʾ������,��ʾ�˵�������ı������:
# 
##########################################################################/

#���ð�װInstallĿ¼
INSTALL=$PWD/output

#����Ŀ¼���б��밲װ
cd x264
chmod 777 configure config.sub config.guess version.sh
if test -s config.mak; then
    rm config.mak
fi

#����
CC=cl ./configure  --enable-static --disable-opencl --prefix=$INSTALL

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
    exit $ret
fi

#������������,�������Ҫ�����Ľ���ŵ���ǰĿ¼�µ�output�м���
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
