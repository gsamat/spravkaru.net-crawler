#!/bin/sh
out=./streets/`echo $1 | sed 's!.*streets/\(.*\)/!\1!' | tr '/' '-'`
(echo $1 && curl $1 | grep -Eo -e "http://spravkaru.net/streets/[0-9/]*/page[0-9]*/" ) > $out
test -s $out || { echo "zero file for $1" >&2; exit 1; }
cat $out | xargs -L1 ./get-street-page.sh