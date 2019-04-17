#!/bin/sh

BOOKSDIR=${1:-../ebooks/docs/ebooks/}
if ! [ -d "$BOOKSDIR" ]; then
	echo "Folder '$BOOKSDIR' doesn't exist"
	exit 1
fi

(
	cd $BOOKSDIR > /dev/null 2>&1 || exit;
	find . -type f -name 'cover.*'
) > list.txt

mkdir -p covers
rsync -i --size-only --files-from=list.txt $BOOKSDIR covers/
echo "Updated"
