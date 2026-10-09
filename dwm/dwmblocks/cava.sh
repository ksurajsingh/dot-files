#! /bin/bash

# Run Cava and format its output
cava_output=$(cava -p ~/.config/cava/config | awk '/\//{printf "%s ", $0}')

# Output the Cava information to dwmblocks
echo "🎵 $cava_output"

