# Grin Node for Umbrel

This is a Grin node application for the Umbrel community app store.


1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/umbrel-grin-node.git
   
Navigate to the application directory:
cd umbrel-grin-node/app

Build the Docker image:
docker build -t grin-node.

Run the container:
docker-compose up

Access the Grin node through the exposed ports:
3414: Grin peer-to-peer network
13414: Grin owner API
13415: Grin foreign API
