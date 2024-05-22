#!/bin/bash

# Update and install dependencies
apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    pkg-config \
    curl \
    git

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Clone Grin repository
git clone https://github.com/mimblewimble/grin.git
cd grin

# Build Grin
cargo build --release

# Create data directory
mkdir -p /root/.grin/main

# Run Grin
./target/release/grin
