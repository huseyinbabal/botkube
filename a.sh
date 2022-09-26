#!/bin/bash

CURRENT_BRANCH=release-0.30
BASE_TAG=$(git log --pretty=format:"%N" --show-notes="${CURRENT_BRANCH}" | awk -F',' '{ print $2 }' | awk NF | awk '{ print $2 }')
REMOTE_TAG=$(git ls-remote --tags origin $BASE_TAG)
echo $BASE_TAG
echo $REMOTE_TAG
if [ -n "$REMOTE_TAG" ]; then
    echo "${BASE_TAG} is already in remote, exiting..."
    exit 1
fi
