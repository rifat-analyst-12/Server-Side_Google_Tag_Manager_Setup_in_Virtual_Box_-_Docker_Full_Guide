# sGTM Local Setup — VirtualBox + Docker + Cloudflare Tunnel

Server-side Google Tag Manager (sGTM) locally test করার complete guide। VirtualBox এ Ubuntu চালিয়ে Docker দিয়ে sGTM run করা, Cloudflare Tunnel দিয়ে public করা।

## Architecture

```
Browser (Web GTM Container)
        |
        v
Cloudflare Tunnel (public HTTPS URL)
        |
        v
Ubuntu VM (VirtualBox)
        |
        +---> sGTM Tagging Server  (Docker, port 8080) ---> GA4 / Google Ads / Meta CAPI
        |
        +---> sGTM Preview Server  (Docker, port 8081) ---> GTM Debug Panel
```

## Quick Start

```bash
# ১. sGTM Tagging Server চালু করো
sudo docker run -d --name sgtm \
  -e CONTAINER_CONFIG='YOUR_CONFIG' \
  -p 8080:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable

# ২. Preview Server চালু করো
sudo docker run -d --name sgtm-preview \
  -e CONTAINER_CONFIG='YOUR_CONFIG' \
  -e RUN_AS_PREVIEW_SERVER=true \
  -p 8081:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable

# ৩. Health check
curl http://localhost:8080/healthz
```

## Requirements

| Item | Details |
|------|---------|
| RAM | 16 GB (VM এ 4 GB দিতে হবে) |
| Disk | 30 GB free (VM এর জন্য) |
| OS | Windows 10/11 |
| VirtualBox | 7.x |
| Ubuntu | 24.04 LTS Desktop |
| Cloudflare | Free account + domain |

## Phases

| Phase | কী করব | Status |
|-------|--------|--------|
| Phase 1 | Local PC + VirtualBox + Quick Tunnel | ✅ এই repo |
| Phase 2 | Hetzner VPS + Named Tunnel + Fixed Domain | 🔜 Coming |

## Files

```
sgtm-local-setup/
├── README.md                    # এই file (overview)
├── docs/
│   ├── 01-windows-setup.md      # Windows এ VirtualBox + Ubuntu setup
│   ├── 02-docker-install.md     # Ubuntu তে Docker install
│   ├── 03-sgtm-setup.md         # sGTM container setup
│   ├── 04-cloudflare-tunnel.md  # Cloudflare Tunnel setup
│   ├── 05-gtm-configuration.md  # GTM Web + Server container config
│   ├── 06-daily-commands.md     # Daily use commands
│   └── 07-troubleshooting.md    # Common errors + fixes
├── scripts/
│   ├── docker-install.sh        # Docker install script (Ubuntu)
│   ├── start-sgtm.sh            # sGTM containers start script
│   └── start-tunnels.sh         # Cloudflare tunnels start script
└── configs/
    └── sgtm-notes.md            # Container config notes
```
