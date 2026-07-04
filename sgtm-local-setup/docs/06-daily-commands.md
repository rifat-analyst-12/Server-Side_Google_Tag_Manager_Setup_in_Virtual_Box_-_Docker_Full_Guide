# Daily Use Commands

## প্রতিদিন VM Start করার পরে

```bash
# Containers চালু করো
sudo docker start sgtm
sudo docker start sgtm-preview

# Terminal 1 — Tagging tunnel
cloudflared tunnel --url http://localhost:8080

# Terminal 2 — Preview tunnel
cloudflared tunnel --url http://localhost:8081
```

> Quick tunnel প্রতিবার নতুন URL দেয়, GTM এ আপডেট করতে হবে।

---

## Useful Docker Commands

```bash
# চলন্ত containers দেখো
sudo docker ps

# সব containers (বন্ধ সহ)
sudo docker ps -a

# Logs দেখো
sudo docker logs sgtm
sudo docker logs sgtm-preview

# বন্ধ করো
sudo docker stop sgtm sgtm-preview

# মুছে ফেলো
sudo docker rm -f sgtm sgtm-preview

# Health check
curl http://localhost:8080/healthz
curl http://localhost:8081/healthz
```
