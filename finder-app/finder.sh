#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Function to count matching lines in a file
count_matching_lines() {
    grep -c "$searchstr" "$1"
}

# Recursively find all files in filesdir and count matching lines
total_files=0
total_matching_lines=0
while IFS= read -rd '' file; do
    ((total_files++))
    lines_matching=$(count_matching_lines "$file")
    ((total_matching_lines += lines_matching))
done < <(find "$filesdir" -type f -print0)

echo "The number of files are $total_files and the number of matching lines are $total_matching_lines"
<<<<<<< HEAD

=======
>>>>>>> Yeni
