#!/bin/bash

SRC_ROOT="/home/ubuntu/skycluster-project/skycluster-compositions"
SRC_FILE="$1"
TMPL_ROOT="../crds/templates"
CRDS_ROOT="../crds/crds"

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

# Determine destination based on filename
if [[ "$SRC_FILE" == *"composition.yaml"* ]]; then
    DEST_PATH="$TMPL_ROOT/$SRC_FILE"
elif [[ "$SRC_FILE" == *"definition.yaml"* ]]; then
    DEST_PATH="$CRDS_ROOT/$SRC_FILE"
else
    echo "Error: Filename must contain either 'compositions.yaml' or 'definition.yaml'"
    exit 1
fi

# # Create the target directory
mkdir -p "$(dirname "$DEST_PATH")"

# # Copy the file
cp "$FULL_PATH" "$DEST_PATH"

echo "Copied $SRC_FILE"