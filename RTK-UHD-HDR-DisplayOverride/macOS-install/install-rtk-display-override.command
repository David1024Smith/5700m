#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/DisplayVendorID-4a8b"
TARGET_ROOT="/Library/Displays/Contents/Resources/Overrides"
TARGET_DIR="$TARGET_ROOT/DisplayVendorID-4a8b"

if [ ! -f "$SOURCE_DIR/DisplayProductID-1b1a" ]; then
  echo "Cannot find DisplayProductID-1b1a next to this installer."
  exit 1
fi

sudo mkdir -p "$TARGET_ROOT"
sudo ditto "$SOURCE_DIR" "$TARGET_DIR"
sudo chown -R root:wheel "$TARGET_DIR"
sudo chmod -R a+rX "$TARGET_DIR"

echo "Installed RTK UHD HDR display override."
echo "Reboot macOS, then reconnect the HDMI/Type-C display and re-test HiDPI/audio."
