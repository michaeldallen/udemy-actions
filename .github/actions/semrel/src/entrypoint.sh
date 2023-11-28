#!/usr/bin/env bash
#set -e
#set -u
#set -x


pwd| sed 's/^/pwd:/'
find . | fgrep -v .git | sort | sed 's/^/find:/'


set 2>&1 | sed 's/^/set:/'


# if the permissions are correct we should be able to create and delete a tag on origin
git tag -a -m aaa foo
git push origin foo
git push -d origin foo
git tag -d foo

npx --no-install semantic-release --dry-run
