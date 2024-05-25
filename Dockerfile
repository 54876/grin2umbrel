FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y build-essential cmake pkg-config libssl-dev && \
    apt-get install -y curl git clang

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH

RUN git clone https://github.com/mimblewimble/grin.git /grin

WORKDIR /grin
RUN cargo build --release

RUN mkdir -p .grin

EXPOSE 3414 3415

CMD ["./target/release/grin"]
