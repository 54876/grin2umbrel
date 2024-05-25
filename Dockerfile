# Use a base image compatible with Raspberry Pi (e.g., ARM architecture)
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y build-essential cmake pkg-config libssl-dev && \
    apt-get install -y curl git clang

# Clone Grin repository
RUN git clone https://github.com/mimblewimble/grin.git /grin

# Build Grin
WORKDIR /grin
RUN cargo build --release

# Create a directory for Grin data
RUN mkdir -p /root/.grin

# Expose the necessary ports
EXPOSE 3414 3415

# Run Grin node
CMD ["./target/release/grin"]
