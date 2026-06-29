#!/usr/bin/env bash
#
# package.sh — build a Factorio-portal-ready zip of Gleba Reimagined.
#
# What it does:
#   1. Reads the mod name + version straight from info.json (single source of
#      truth — you never edit this script when you bump versions).
#   2. Copies the mod into a correctly-named folder, stripping dev/OS junk.
#   3. Produces  <name>_<version>.zip  in the mod root, with a single top-level
#      folder inside (exactly what the mod portal and the local mods/ folder want).
#
# Usage:
#   chmod +x package.sh      # once, to make it executable
#   ./package.sh
#
# Safe to run repeatedly: it overwrites any existing zip for the same version.

set -euo pipefail   # exit on error, on unset vars, and on any failure in a pipe

# Always operate from the directory this script lives in, regardless of where
# it's invoked from. ${BASH_SOURCE[0]} is the path to this script itself.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# --- Single source of truth: pull name + version out of info.json -----------
# Note: grep '"version"' does NOT match '"factorio_version"', because there is
# no quote character immediately before the word 'version' in that key name.
MOD_NAME=$(grep '"name"'    info.json | sed -E 's/.*"name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
VERSION=$( grep '"version"' info.json | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')

if [[ -z "$MOD_NAME" || -z "$VERSION" ]]; then
  echo "ERROR: couldn't parse name/version from info.json" >&2
  exit 1
fi

FOLDER="${MOD_NAME}_${VERSION}"    # internal folder name (Factorio's recommended form)
ZIP="${MOD_NAME}_${VERSION}.zip"   # e.g. gleba-reimagined_1.0.3.zip
STAGING="$(mktemp -d)"             # clean build area outside the repo

# Guarantee the temp staging dir is cleaned up, even if something below fails.
trap 'rm -rf "$STAGING"' EXIT

echo "Packaging ${MOD_NAME} v${VERSION} ..."

# --- Copy mod files into staging/<folder>, excluding dev + OS junk ----------
# Exclude patterns without a leading slash match at ANY depth, so nested
# .DS_Store files and the locale .bak get dropped too.
rsync -a \
  --exclude='.git/' \
  --exclude='.idea/' \
  --exclude='.gitignore' \
  --exclude='.DS_Store' \
  --exclude='*.bak' \
  --exclude='*.zip' \
  --exclude='package.sh' \
  ./ "${STAGING}/${FOLDER}/"

# --- Zip it: archive root must be the single ${FOLDER} directory ------------
# Zipping from inside $STAGING keeps paths relative to that folder.
#   -r recurse   -q quiet   -X strip macOS extended attributes / resource forks
rm -f "${SCRIPT_DIR}/${ZIP}"       # clear any stale build of this exact version
( cd "$STAGING" && zip -r -q -X "${SCRIPT_DIR}/${ZIP}" "${FOLDER}" )

# --- Report -----------------------------------------------------------------
echo "Built ${ZIP}"
echo "Contents:"
unzip -l "${SCRIPT_DIR}/${ZIP}"
echo
echo "Done -> ${SCRIPT_DIR}/${ZIP}"
