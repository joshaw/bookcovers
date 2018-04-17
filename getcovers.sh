#!/bin/sh

BOOKSDIR=${1:-../ebooks/docs/ebooks/}
(
	cd $BOOKSDIR || exit;
	find . -name 'cover.*'
) > list.tmp

if ! cmp -s list.txt list.tmp; then
	mv list.tmp list.txt
	mkdir -p covers
	rsync -P --files-from=list.txt $BOOKSDIR covers/
	echo "Updated"
else
	rm list.tmp
	echo "No change"
fi
