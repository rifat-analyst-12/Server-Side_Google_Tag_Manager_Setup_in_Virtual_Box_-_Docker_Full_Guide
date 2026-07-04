# Cloudflare Tunnel Setup

## cloudflared Install

```bash
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared-linux-amd64.deb
cloudflared --version
```

---

## Tagging Server Tunnel (Port 8080)

Terminal 1 এ:
```bash
cloudflared tunnel --url http://localhost:8080
```

URL পাবে যেমন: `https://abc-xyz-123.trycloudflare.com`
এটাই **TAGGING SERVER URL**

---

## Preview Server Tunnel (Port 8081)

Terminal 2 এ:
```bash
cloudflared tunnel --url http://localhost:8081
```

এটাই **PREVIEW SERVER URL**

---

## URL কোথায় বসে

| কোথায় | কোন URL |
|--------|---------|
| GTM Server Settings → Server container URLs | Tagging URL (8080) |
| Web Tag → server_container_url | Tagging URL (8080) |
| Docker PREVIEW_SERVER_URL env var | Preview URL (8081) |

> Quick tunnel প্রতিবার restart এ নতুন URL দেয়।
> Phase 2 এ Named Tunnel দিয়ে fixed URL করা হবে।
