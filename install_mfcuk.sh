#!/bin/bash
CURRENT_DIR="$(pwd)"
mkdir -p builds/nfc
cd builds/nfc
wget https://github.com/nfc-tools/libnfc/releases/download/libnfc-1.5.1/libnfc-1.5.1.tar.gz
tar zxf libnfc-1.5.1.tar.gz
cd libnfc-1.5.1
./configure --prefix=$CURRENT_DIR/builds/nfc/libnfc-1.5.1 --with-drivers=all --enable-serial-autoprobe
make -j2
cd ..

git clone https://github.com/nfc-tools/mfcuk mfcuk-r65
cd mfcuk-r65
git reset --hard 1b6d022
autoreconf -is
LIBNFC_CFLAGS=-I$CURRENT_DIR/builds/nfc/libnfc-1.5.1/include  LIBNFC_LIBS="-L$CURRENT_DIR/builds/nfc/libnfc-1.5.1/libnfc/.libs -lnfc" ./configure --prefix=$CURRENT_DIR/builds/nfc/libnfc-1.5.1
make -j2
cd ..

LD_LIBRARY_PATH=$CURRENT_DIR/builds/nfc/libnfc-1.5.1/libnfc/.libs mfcuk-r65/src/mfcuk
