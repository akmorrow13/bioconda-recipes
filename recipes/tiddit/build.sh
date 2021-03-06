#!/bin/bash
outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir
mkdir -p $PREFIX/bin
echo $PREFIX

mkdir build
cd build
cmake ..
make
cd ../src
python -m pip install . --ignore-installed --no-deps -vv
cd ../build
make DESTDIR=${PREFIX} install
cd ..

mv TIDDIT.py ${PREFIX}/bin
ln -s ${PREFIX}/bin/TIDDIT.py $PREFIX/bin/tiddit
chmod a+x ${PREFIX}/bin/*
