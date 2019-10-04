#/bin/bash

#blobtools=$PREFIX/opt/$PKG_NAME-$PKG_VERSION
#mkdir -p $blobtools
#cp -a ./* $blobtools
#cd $blobtools
#
#sed -i -e '4d;16,29d;50d' setup.py
$PYTHON setup.py install --single-version-externally-managed --record=/tmp/record.txt

echo '#!/usr/bin/env bash' > $PREFIX/bin/blobtools-build_nodesdb
echo "blobtools=$blobtools" >> $PREFIX/bin/blobtools-build_nodesdb
cat $RECIPE_DIR/blobtools-build_nodesdb >> $PREFIX/bin/blobtools-build_nodesdb
chmod +x $PREFIX/bin/blobtools-build_nodesdb
