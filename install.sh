#!/bin/bash

set -e

echo "📥 Installing mkfromtree..."

TMP_FILE=$(mktemp)

# Download the script first
curl -fsSL https://raw.githubusercontent.com/codewithmoss/mkfromtree/main/mkfromtree.sh -o "$TMP_FILE"

# Move it to /usr/local/bin/ with sudo
sudo mv "$TMP_FILE" /usr/local/bin/mkfromtree

# Make it executable
sudo chmod +x /usr/local/bin/mkfromtree

echo "✅ mkfromtree installed successfully!"
echo "📂 You can now run 'mkfromtree' from anywhere."

