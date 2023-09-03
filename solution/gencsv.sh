#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

start_index=$1
end_index=$2

if [ "$start_index" -ge "$end_index" ]; then
    echo "Error: Start index must be less than end index."
    exit 1
fi

output_file="inputFile.csv"

# Create or overwrite the CSV file
> "$output_file"

for ((i = start_index; i <= end_index; i++)); do
    # Generate a random number between 1 and 100
    random_number=$((1 + RANDOM % 100))

    # Append the entry to the CSV file
    echo "$i, $random_number" >> "$output_file"
done

echo "CSV file '$output_file' generated with entries from $start_index to $end_index."
