#!/bin/bash
set -e

echo "Building custom-glance Docker image..."
docker build -t custom-glance .

echo "Build complete! You can now run the image with:"
echo "docker compose up -d"
