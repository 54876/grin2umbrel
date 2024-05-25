FROM ubuntu:20.04

# Installer les dépendances
RUN apt-get update && \
    apt-get install -y build-essential cmake pkg-config libssl-dev && \
    apt-get install -y curl git clang

# Installer Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH

# Cloner le dépôt Grin
RUN git clone https://github.com/mimblewimble/grin.git /grin

# Créer un utilisateur non-root
RUN useradd -ms /bin/bash grinuser

# Changer les permissions du dossier Grin
RUN chown -R grinuser:grinuser /grin

# Passer à l'utilisateur non-root
USER grinuser

# Construire Grin
WORKDIR /grin
RUN cargo build --release

# Créer un répertoire pour les données de Grin
RUN mkdir -p /home/grinuser/.grin

# Exposer les ports nécessaires
EXPOSE 3414 3415

# Lancer le nœud Grin
CMD ["./target/release/grin"]
