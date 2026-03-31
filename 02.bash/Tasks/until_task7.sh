#!/bin/bash

# Ask user for filename
read -p "Enter the filename: " file

# Check if file exists
if [ ! -f "$file" ]; then
    echo "File does not exist!"
    exit 1
fi

# Loop until file size > 1024 KB (1 MB)
until [ $(stat -c%s "$file") -gt $((1024*1024)) ]; do
    echo $( stat -c%s "$file" )
    cat "$file" "$file" > temp_file   
    mv temp_file "$file"
done

echo "File '$file' has reached size greater than 1024 KB."
