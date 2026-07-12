#!/bin/bash
cd "${0%/*}"
OUTPUT="${1:-deleter.spl}"
chmod -R u=rwX,go= *
chmod -R u-x+X *
chmod -R u=rwx,go= bin/*
# The checkout dir isn't always named "deleter" (e.g. CI clones the repo as
# "splunk_deleter"), but the packaged top-level dir must be, since that's the
# real app id (default/app.conf [package] id, package.json name).
APPDIR="$(basename "$PWD")"
cd ..
tar -cpzf $OUTPUT --exclude=.* --overwrite --transform "s,^$APPDIR,deleter," "$APPDIR"
