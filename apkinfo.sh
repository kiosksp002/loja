#!/bin/bash

STRLINE=`aapt dump badging $1 | grep "^package:" | cut -d" " -f2,3`

HASHCOD=`md5sum $1 | cut -d" " -f1`
PKGNAME=`echo $STRLINE | cut -d"'" -f2`
VERCODE=`echo $STRLINE | cut -d"'" -f4`
FILENAM=`basename $1`

#########
. gitsetup.sh
cp $1 $FILENAM
git add -A
git commit -m "$FILENAM"
git push origin main

#########


echo "FHASH='$HASHCOD'"
echo "PKGN='$PKGNAME'"
echo "VC='$VERCODE'"
echo "data['link']='https://raw.githubusercontent.com/kiosksp002/loja/main/$FILENAM'"





