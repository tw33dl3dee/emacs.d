#!/bin/sh

REV=`svnversion`
TIME=`which time`

[[ -z "$REV" ]] || [[ -z "$TIME" ]] && exit 1

(
	printf "%-8s " $REV
	$TIME -f%E emacs -eval '(kill-emacs)' 2>&1
) >> bench.log

tail -n10 bench.log
