#!/bin/bash

PYV="3.6"
FAUCETHOME=`dirname $0`"/../.."
TMPDIR=`mktemp -d -p /var/tmp`
CONFIG="$FAUCETHOME/setup.cfg"
PARARGS="parallel --delay 2 --bar --halt now,fail=1"
PYTYPE=`which pytype`
PYTYPEARGS="python$PYV $PYTYPE --config $CONFIG -o $TMPDIR/{/} {}"
PYHEADER=`head -1 $PYTYPE`
SRCFILES="$FAUCETHOME/tests/codecheck/src_files.sh"
echo "Using $PYTYPE (header $PYHEADER)"

$SRCFILES | shuf | $PARARGS $PYTYPEARGS || exit 1
rm -rf $TMPDIR
