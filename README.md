# Grin Node for Umbrel

This is a Grin node application for the Umbrel community app store.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/54876/grin2umbrel.git
   ```

2. Navigate to the application directory:
   ```bash
   cd grin2umbrel/app
   ```

3. Build the Docker image:
   ```bash
   docker build -t grin-node .
   ```

4. Run the container:
   ```bash
   docker-compose up
   ```

5. Access the Grin node through the exposed ports:
   - 3414: Grin peer-to-peer network
   - 13414: Grin owner API
   - 13415: Grin foreign API
