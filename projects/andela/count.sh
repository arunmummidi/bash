#!/bin/bash

filename=$1

while IFS= read -r line || [[ -n "$line" ]]; do
    IFS="|" read -ra filenames <<< "$line"
    unique_filenames=()

    for filename in "${filenames[@]}"; do
        name="${filename%.*}"
        count=$(grep -o "$name" <<< "${filenames[*]}" | wc -l)

        if [[ $count -eq 1 ]]; then
            unique_filenames+=("$filename")
        fi
    done

    if [[ ${#unique_filenames[@]} -gt 0 ]]; then
        output=$(printf '%s' "${unique_filenames[*]}")
        output="${output// /|}"
        echo "$output"
    fi
done < "$filename"
