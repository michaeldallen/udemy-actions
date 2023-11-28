#!/usr/bin/env bash
set -e
set -x


echo $(pwd) | sed 's/^/pwd:/'
find . | fgrep -v .git | sort | sed 's/^/find:/'


set 2>&1 | sed 's/^/set:/'


# allow unknown hosts
export GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"


# add MW root certs
cat /workdir/src/certs/mw-sha2-*.pem > /workdir/mw-sha2-uber.pem
git config --global http.sslCAInfo /workdir/mw-sha2-uber.pem

# use https instead of ssh
git config --global url.https://github.mathworks.com/.insteadOf git@github.mathworks.com:

git config --global user.email "${GITHUB_ACTOR}@mathworks.com"

grep . ~/.gitconfig /dev/null


# if the permissions are correct we should be able to create and delete a tag on origin
git tag -a -m aaa foo
git push origin foo
git push -d origin foo
git tag -d foo

npx --no-install semantic-release --dry-run
