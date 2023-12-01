function cp {
    if [ $# -ne 2 ]; then
        echo "Usage: cp [source] [destination]"
        return 1
    fi

    local src=$1
    local dest=$2

    # Check if source file exists
    if [ ! -f "$src" ]; then
        echo "Source file does not exist"
        return 1
    fi

    # Handle binary data
    while IFS= read -r -d '' -n 1 byte; do
        printf '%b' "$byte"
    done < "$src" > "$dest"
}
