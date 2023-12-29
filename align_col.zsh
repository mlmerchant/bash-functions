#!/usr/bin/env zsh

# Function to align columns
align_columns() {
    awk -F'\t' '

    # Pass 1: Calculate max length of each field
    NR == FNR {
        for (i = 1; i <= NF; i++) {
            if (length($i) > max_length[i]) {
                max_length[i] = length($i);
            }
        }
        next;
    }

    # Pass 2: Print aligned fields
    {
        for (i = 1; i <= NF; i++) {
            printf("%-*s ", max_length[i], $i);
        }
        printf("\n");
    }
    ' "$1" "$1"
}

# Usage: Call the function with the file name as an argument
# Example: align_columns "yourfile.tsv"

# Check if a file name is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Call the function with the provided file
align_columns "$1"
