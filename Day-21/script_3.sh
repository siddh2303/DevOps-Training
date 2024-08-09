#!/bin/bash

# Function to calculate the average of numbers in a file
calculate_average() {
    local file=$1
    local total=0
    local count=0

    while read -r line
    do
        if [[ $line =~ ^[0-9]+$ ]]; then
            total=$((total + line))
            count=$((count + 1))
        else
            echo "Warning: Non-numeric value '$line' ignored."
        fi
    done < "$file"

    if [ $count -eq 0 ]; then
        echo "Error: No valid numbers in the file."
        exit 1
    fi

    echo "Average: $((total / count))"
}

# Main script
read -p "Enter the file name: " filename

# Error handling for file existence
if [ ! -f $filename ]; then
    echo "Error: File '$filename' not found!"
    exit 1
fi

# Call the function to calculate average
calculate_average $filename
