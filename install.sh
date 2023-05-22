#!/bin/bash

# Install and deploy the developpement
# environement, ready for usage!

set -e
base_dir=$(cd "$(dirname "$0")" && pwd)

urlCapture=git@github.com:NeuralStar/NeuralCapture.git
urlAI=git@github.com:NeuralStar/Prod_NeuralStart.git

# Get all the environements
mkdir -p $base_dir
cd $base_dir
git clone $urlCapture Capture || true
git clone $urlAI AI || true

# Prepare AI environement
cd $base_dir/AI
python3 -m venv .env
source .env/bin/activate
pip3 install -r requirements.txt

# Prepare Capture environement
cd $base_dir/Capture
make
