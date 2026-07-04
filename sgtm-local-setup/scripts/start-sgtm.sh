#!/bin/bash
# sGTM Containers Start Script
# Usage: ./start-sgtm.sh YOUR_CONTAINER_CONFIG YOUR_PREVIEW_URL

CONTAINER_CONFIG=${1:-"YOUR_CONTAINER_CONFIG_HERE"}
PREVIEW_URL=${2:-""}

echo "=== Starting sGTM Containers ==="

# Tagging Server
sudo docker run -d \
  --name sgtm \
  --restart always \
  -e CONTAINER_CONFIG="$CONTAINER_CONFIG" \
  ${PREVIEW_URL:+-e PREVIEW_SERVER_URL="$PREVIEW_URL"} \
  -p 8080:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable

# Preview Server
sudo docker run -d \
  --name sgtm-preview \
  --restart always \
  -e CONTAINER_CONFIG="$CONTAINER_CONFIG" \
  -e RUN_AS_PREVIEW_SERVER=true \
  -p 8081:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable

echo "=== Health Check ==="
sleep 5
curl http://localhost:8080/healthz
curl http://localhost:8081/healthz

echo ""
echo "=== Containers running ==="
sudo docker ps
