#!/bin/bash
# psp-tools.sh by fjtrujy

## Download the source code.
REPO_URL="https://github.com/fjtrujy/psp-tools"
REPO_FOLDER="psp-tools"
BRANCH_NAME="main"
if test ! -d "$REPO_FOLDER"; then
	git clone --depth 1 -b $BRANCH_NAME $REPO_URL && cd $REPO_FOLDER || { exit 1; }
else
	cd $REPO_FOLDER && git fetch origin && git reset --hard origin/${BRANCH_NAME} || { exit 1; }
fi

## Build all tools
./build-all.sh          || { exit 1; }