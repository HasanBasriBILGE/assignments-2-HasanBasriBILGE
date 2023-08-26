#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the specified file
echo "$writestr" > "$writefile"

# Check if the write was successful
if [ $? -ne 0 ]; then
    echo "Error: Could not write to '$writefile'."
    exit 1
fi

echo "File '$writefile' created with content:"
echo "$writestr"
