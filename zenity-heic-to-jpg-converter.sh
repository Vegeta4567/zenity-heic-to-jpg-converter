#!/bin/bash

# Init counters
converted=0
deleted=0
errors=0

# Temp files to stock the results
tmp_converted=$(mktemp)
tmp_deleted=$(mktemp)
tmp_errors=$(mktemp)

# Message to guide user
zenity --info --text="Please select the folder containing the .heic files to be converted. If there are subfolders containing .heic files inside, they will be included in the conversion." --title="Choose folder"

# Ask the directory to be processed
dir=$(zenity --file-selection --directory --title="Select the folder to be processed")
if [ -z "$dir" ]; then
    zenity --error --text="No folder selected. Operation aborted!" --title="Error"
    exit 1
fi

# Count the number of .heic files in the folder
total_files=$(find "$dir" -type f \( -iname "*.heic" -o -iname "*.HEIC" \) | wc -l)
if [ "$total_files" -eq 0 ]; then
    zenity --info --text="No .heic files found in $dir." --title="No files found"
    exit 0
fi

# Confirmation
zenity --question --text="Would you like to convert and delete .heic files in\n$dir ?\n\nNumber of files to be processed : $total_files" --ok-label="Yes" --cancel-label="No" --title="Confirmation"
if [ $? -ne 0 ]; then
    exit 0
fi

# Lauch progress bar
(
    current=0
    # Browse .heic
    find "$dir" -type f \( -iname "*.heic" -o -iname "*.HEIC" \) -print0 | while IFS= read -r -d '' file; do
        base=$(basename "$file" | sed 's/\.[Hh][Ee][Ii][Cc]//')
        output="$(dirname "$file")/$base.jpg"

        # File conversion
        if heif-convert -q 90 "$file" "$output"; then
            echo "$file" >> "$tmp_converted"
            # Delete the .heic file
            if rm "$file"; then
                echo "$file" >> "$tmp_deleted"
            else
                echo "$file" >> "$tmp_errors"
            fi
        else
            echo "$file" >> "$tmp_errors"
        fi

        ((current++))
        # Percentage
        percentage=$((current * 100 / total_files))
        echo "$percentage"
        echo "# Processing of : $file"
    done
) | zenity --progress \
  --title="Conversion in progress..." \
  --text="Handling .heic files..." \
  --percentage=0 \
  --auto-close \
  --auto-kill

# Read counters
converted=$(wc -l < "$tmp_converted")
deleted=$(wc -l < "$tmp_deleted")
errors=$(wc -l < "$tmp_errors")

# Clean temp files
rm -f "$tmp_converted" "$tmp_deleted" "$tmp_errors"

# Results
zenity --info --text="--- Results ---\nConverted files : $converted\nDeleted files : $deleted\nErrors : $errors" --title="Summary of the conversion"
