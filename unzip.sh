#!/bin/bash

rm -fr debtmp
rm -fr roottemp
mkdir -p debtmp
mkdir -p roottemp
tar xf new.tar -C debtmp

for deb in `ls debtmp/*.deb`
do
  echo "deb:$deb"
  mv $deb $deb.gz
  gunzip $deb.gz
  cd roottemp
  cpio -idmv < ../$deb
  cd ..
done
