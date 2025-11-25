#!/bin/bash

SRC_ROOT="/home/ubuntu/skycluster-project/skycluster-compositions"
SRC_FILE="$1"
DEST_ROOT="../crds/templates"

if [[ -z "$SRC_FILE" ]]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

if [[ ! -f "$SRC_ROOT/$SRC_FILE" ]]; then
    echo "File not found: $SRC_ROOT/$SRC_FILE"
    exit 1
fi

# Remove leading './' if present
SRC_FILE=${SRC_FILE#./}
FULL_PATH="${SRC_ROOT}/${SRC_FILE}"

# Full destination path
DEST_PATH="$DEST_ROOT/$SRC_FILE"

# # Create the target directory
mkdir -p "$(dirname "$DEST_PATH")"

# # Copy the file
cp "$FULL_PATH" "$DEST_PATH"

echo "Copied $SRC_FILE"