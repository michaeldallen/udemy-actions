#!/usr/bin/env bash

set -e
set -u
set -x

git config --global --add safe.directory /github/workspace
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
  
pwd| sed 's/^/pwd:/'

echo $(pwd) | sed 's/^/pwd:/'
find . | fgrep -v .git | sort | sed 's/^/find:/'


set 2>&1 | sed 's/^/set:/'




cp -v /workdir/src/dot_releaserc .releaserc 



npx --no-install semantic-release #--dry-run
