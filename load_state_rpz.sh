#!/bin/sh

link_table="https://docs.google.com/spreadsheets/d/e/2PACX-1vSUGz_HYrZcOV5IRrG4H6CXGSAFXa4BKZNOalWLA-HIZ7SvxmS2QOD5NvMgubEsLykAAUXex888xhHm/pubhtml"

browsers=(w3m firefox google-chrome)

wget $link_table -O ./index.html

typeset started=false

for i in $browsers; do
	which $i
	res=$?
	if [[ $res == 0 ]]; then
		started=true
		$i "`pwd`/"/index.html
		break
	fi
done

if [[ $started == false ]];then
	echo "Browser not found..."
fi
