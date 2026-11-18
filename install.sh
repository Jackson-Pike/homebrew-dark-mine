#!/usr/bin/env bash
# Dark Mine installer for macOS (Intel and Apple Silicon).
#   curl -fsSL https://raw.githubusercontent.com/Jackson-Pike/homebrew-dark-mine/main/install.sh | bash
# Installs to ~/Applications/Dark Mine.app (replacing an older copy) and opens it.
set -euo pipefail

URL="${DARKMINE_ZIP_URL:-https://github.com/Jackson-Pike/homebrew-dark-mine/releases/latest/download/DarkMine-Mac.zip}"
DEST="$HOME/Applications"
APP="$DEST/Dark Mine.app"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer is for macOS. On Windows use install.ps1 (see the README)." >&2
  exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Downloading Dark Mine..."
curl -fL --progress-bar "$URL" -o "$TMP/DarkMine-Mac.zip"
ditto -x -k "$TMP/DarkMine-Mac.zip" "$TMP/unpacked"
if [[ ! -d "$TMP/unpacked/Dark Mine.app" ]]; then
  echo "The download didn't contain Dark Mine.app." >&2
  exit 1
fi

mkdir -p "$DEST"
rm -rf "$APP"
mv "$TMP/unpacked/Dark Mine.app" "$APP"
# The app isn't signed by a paid Apple developer account; clear the "downloaded" flag so macOS lets it open.
xattr -dr com.apple.quarantine "$APP" 2>/dev/null || true

echo "Installed: $APP"
if [[ -z "${DARKMINE_NO_LAUNCH:-}" ]]; then
  open "$APP"
fi
