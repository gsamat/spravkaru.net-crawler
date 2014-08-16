#!/bin/sh
out=./streets/`echo $1 | sed 's!.*streets/\(.*\)/!\1!' | tr '/' '-'`.page
(echo $1 && curl $1 | grep -Eo -e "http://spravkaru.net/streets/7/49[59]/[0-9]*/[0-9]*/" ) > $out
test -s $out || { echo "zero file for $1" >&2; exit 1; }
cat $out | xargs -L1 ./get-building.sh