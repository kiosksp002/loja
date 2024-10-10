#!/bin/bash

STRLINE=`aapt dump badging $1 | grep "^package:" | cut -d" " -f2,3`

HASHCOD=`md5sum $1 | cut -d" " -f1`
PKGNAME=`echo $STRLINE | cut -d"'" -f2`
VERCODE=`echo $STRLINE | cut -d"'" -f4`
FILENAM=`basename $1`

#########
read -p "Deseja copiar e carregar apk ? [N/y] " yn
case $yn in
	[Yy]* ) 
		. gitsetup.sh;
		cp $1 $FILENAM;
		git add -A;
		git commit -m "$FILENAM";
		git push origin main;
		;;
	[Nn]* ) echo "---" ;;
	* ) echo "--";;
esac
#########


echo "FHASH='$HASHCOD'"
echo "PKGN='$PKGNAME'"
echo "VC='$VERCODE'"
echo "data['link']='https://raw.githubusercontent.com/kiosksp002/loja/main/$FILENAM'"
echo "data['hash']='$HASHCOD'"

echo
echo "jobmap['XXXXX']='INST $FILENAM';"
echo
echo

########
echo '        {'
echo '            "t": "apk",'
echo '            "l": "INST '$FILENAM'",'
echo '            "h": {'
echo '                "pkgn": "'$PKGNAME'",'
echo '                "vc": "'$VERCODE'",'
echo '                "fh": "'$HASHCOD'"'
echo '            },'
echo '            "d": {'
echo '                "User-Agent": "curl/7.38.0",'
echo '                "link": "https://raw.githubusercontent.com/kiosksp002/loja/main/'$FILENAM'",'
echo '                "ma": true,'
echo '                "ida": true'
echo '            }'
echo '        },'




