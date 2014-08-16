#!/bin/sh
cat list.txt | xargs -L1 ./get-street.sh