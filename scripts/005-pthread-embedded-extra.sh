#!/bin/bash
# pthread-embedded by fjtrujy

## Download the source code.
REPO_URL="https://github.com/fjtrujy/pthread-embedded"
REPO_FOLDER="pthread-embedded"
BRANCH_NAME="psp"
if test ! -d "$REPO_FOLDER"; then
	git clone --depth 1 -b $BRANCH_NAME $REPO_URL && cd $REPO_FOLDER || { exit 1; }
else
	cd $REPO_FOLDER && git fetch origin && git reset --hard origin/${BRANCH_NAME} || { exit 1; }
fi

## Go to platform folder
cd platform/psp || { exit 1; }

## Compile and install.
make --quiet -j $PROC_NR clean          || { exit 1; }
make --quiet -j $PROC_NR all            || { exit 1; }
make --quiet -j $PROC_NR install        || { exit 1; }
make --quiet -j $PROC_NR clean          || { exit 1; }
