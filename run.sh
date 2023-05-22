#!/bin/bash

# Execute the two proccesses in parallels

set -e
base_dir=$(cd "$(dirname "$0")" && pwd)

# Run the AI
cd "$base_dir/AI"
source .env/bin/activate
python3 Runtime.py &
pid=$!

# Ensures server initialization
sleep 3

# Run the Capture software
cd "$base_dir/Capture" || (kill -15 $pid && false)
export LD_LIBRARY_PATH="$PWD/libs:$PWD/libs/SFML-2.5.1/lib:$LD_LIBRARY_PATH"
./NeuralCapture || true

# Stops all when done
kill -15 $pid
