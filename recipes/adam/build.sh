#!/bin/bash

BINARY_HOME=$PREFIX/bin
PACKAGE_HOME=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM

mkdir -p $BINARY_HOME
mkdir -p $PACKAGE_HOME

cp -R * $PACKAGE_HOME

ln -s $PACKAGE_HOME/bin/adam-shell $BINARY_HOME
ln -s $PACKAGE_HOME/bin/adam-submit $BINARY_HOME
ln -s $PACKAGE_HOME/bin/pyadam $BINARY_HOME

# adam
$PYTHON -m pip install python_adam/. --no-deps --ignore-installed -vv

mkdir -p $PREFIX/adam-assembly/target
for f in $PACKAGE_HOME/repo/*.jar ; do
    ln -s $f $PREFIX/adam-assembly/target/
done
