#!/bin/bash

# ----------------------------------------------------
# Git Hooks Installer
# Usage:
#   cd /path/to/your/project
#   /path/to/planning/install-hooks.sh
# OR
#   /path/to/planning/install-hooks.sh /path/to/project
# ----------------------------------------------------

# Determine target repo
if [ $# -eq 0 ]; then
  TARGET_REPO=$(pwd)
else
  TARGET_REPO="$1"
fi

# Path to the planning repo (where this script lives)
SCRIPT_DIR=$(dirname "$0")
PLANNING_HOOKS="$SCRIPT_DIR/.githooks"

# Check that hooks exist
if [ ! -d "$PLANNING_HOOKS" ]; then
  echo "Error: No .githooks folder found in planning repo at $PLANNING_HOOKS"
  exit 1
fi

echo "Installing hooks into $TARGET_REPO ..."

# Create .githooks in target repo
mkdir -p "$TARGET_REPO/.githooks"

# Copy hooks
cp -r "$PLANNING_HOOKS/"* "$TARGET_REPO/.githooks/"

# Make hooks executable
chmod +x "$TARGET_REPO/.githooks/*"

# Configure Git to use hooks
git -C "$TARGET_REPO" config core.hooksPath .githooks

echo "Hooks installed successfully in $TARGET_REPO"
