#!/bin/bash

# mktree.sh - create folders/files from tree structure

# Usage:
# mktree [target_directory] [tree_file]

# Detect arguments
target_dir=""
tree_file=""

if [[ -d "$1" ]]; then
    target_dir="$1"
    shift
else
    target_dir="$(pwd)"
fi

if [[ -f "$1" ]]; then
    tree_file="$1"
    shift
fi

mkdir -p "$target_dir"

# Temporary file for tree input
tempfile=$(mktemp)

# If tree file is provided
if [[ -n "$tree_file" ]]; then
    cp "$tree_file" "$tempfile"
else
    # Open editor to input manually
    ${EDITOR:-nano} "$tempfile"
fi

# Read input
input=$(<"$tempfile")
rm "$tempfile"

# If empty input, exit
if [[ -z "$input" ]]; then
    echo "⚠️  No tree structure provided. Nothing created."
    exit 0
fi

# Filter only valid tree lines
filtered_input=$(echo "$input" | grep -E '[├└]──')

if [[ -z "$filtered_input" ]]; then
    echo "⚠️  No valid tree structure detected. Nothing created."
    exit 0
fi

declare -a stack
declare -a actions

# Top folder detection
top_folder=""
top_line=$(echo "$filtered_input" | head -n 1)
top_folder=$(echo "$top_line" | sed -E 's/^[│ ]*[├└]── //')

while IFS= read -r line; do
    clean_line=$(echo "$line" | sed 's/^[│ ]*//')
    indent=$(echo "$line" | sed -E 's/[^│ ]//g' | wc -c)
    indent=$((indent / 4))
    name=$(echo "$clean_line" | sed 's/[├└]── //')

    if [ -z "$name" ]; then
        continue
    fi

    while [ ${#stack[@]} -gt $indent ]; do
        unset stack[-1]
    done

    stack[$indent]="$name"

    fullpath="$target_dir/$(IFS=/; echo "${stack[*]}")"

    if [[ "$name" == */ ]]; then
        actions+=("mkdir|$fullpath")
    else
        actions+=("touch|$fullpath")
    fi
done <<< "$filtered_input"

echo "🧹 Planned actions:"
for action in "${actions[@]}"; do
    cmd="${action%%|*}"
    path="${action#*|}"
    if [[ "$cmd" == "mkdir" ]]; then
        echo -e "\033[1;34m[D] $path\033[0m"
    else
        echo -e "\033[1;32m[F] $path\033[0m"
    fi
done

read -rp "❓ Proceed with creation? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "❌ Operation cancelled."
    exit 0
fi

for action in "${actions[@]}"; do
    cmd="${action%%|*}"
    path="${action#*|}"
    if [[ "$cmd" == "mkdir" ]]; then
        mkdir -p "$path"
    else
        mkdir -p "$(dirname "$path")"
        touch "$path"
    fi
done

# Save TREE.txt inside top folder
if [[ -n "$top_folder" ]]; then
    save_path="$target_dir/$top_folder/TREE.txt"
    mkdir -p "$(dirname "$save_path")"
    echo "$input" > "$save_path"
    echo "📝 Saved original tree into: $save_path"
fi

echo "✅ Structure created in: $target_dir"
