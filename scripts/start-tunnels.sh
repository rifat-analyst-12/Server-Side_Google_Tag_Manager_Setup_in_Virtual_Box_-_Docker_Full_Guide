#!/bin/bash
# Cloudflare Tunnels Start Script

echo "=== Starting Cloudflare Tunnels ==="
echo "Open two terminals and run:"
echo ""
echo "Terminal 1 (Tagging Server):"
echo "  cloudflared tunnel --url http://localhost:8080"
echo ""
echo "Terminal 2 (Preview Server):"
echo "  cloudflared tunnel --url http://localhost:8081"
echo ""
echo "Copy the URLs and update GTM settings."
