#!/bin/bash
# psptoolchain.sh

# Exit on errors
set -e

# Download the source code.
clone_git_repo github.com pspdev psptoolchain

# Enter the source directory.
cd psptoolchain

# Configure the build. - Only run a subset, to avoid duplication
./toolchain.sh 1 2 3 4 5 7
