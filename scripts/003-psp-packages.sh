#!/bin/bash
# psp-packages by fjtrujy

## Download the source code.
REPO_URL="https://github.com/fjtrujy/psp-packages"
REPO_FOLDER="psp-packages"
BRANCH_NAME="master"
if test ! -d "$REPO_FOLDER"; then
	git clone --depth 1 -b $BRANCH_NAME $REPO_URL && cd $REPO_FOLDER || { exit 1; }
else
	cd $REPO_FOLDER && git fetch origin && git reset --hard origin/${BRANCH_NAME} || { exit 1; }
fi

# Install all packages
./install-latest.sh  "fjtrujy/psp-packages"  || { exit 1; }
