#!/bin/bash

set -e

echo "📥 Installing mktree..."

TMP_FILE=$(mktemp)

# Download the script first
curl -fsSL https://raw.githubusercontent.com/codewithmoss/mktree/main/mktree.sh -o "$TMP_FILE"

# Move it to /usr/local/bin/ with sudo
sudo mv "$TMP_FILE" /usr/local/bin/mktree

# Make it executable
sudo chmod +x /usr/local/bin/mktree

echo "✅ mktree installed successfully!"
echo "📂 You can now run 'mktree' from anywhere."

