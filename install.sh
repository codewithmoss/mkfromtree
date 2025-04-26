#!/bin/bash

set -e

echo "📥 Installing mktree..."

# Download latest script
curl -fsSL https://raw.githubusercontent.com/codewithmoss/mktree/main/mktree.sh -o /usr/local/bin/mktree

# Make it executable
chmod +x /usr/local/bin/mktree

echo "✅ mktree installed successfully!"
echo "📂 You can now run 'mktree' from anywhere."
