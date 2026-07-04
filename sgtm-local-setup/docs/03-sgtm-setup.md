# sGTM Container Setup

## Container Config নেওয়া

1. https://tagmanager.google.com এ যাও
2. Server container open করো
3. **Admin → Container Settings → Manually provision tagging server**
4. Container Config string copy করো

---

## Tagging Server (Port 8080)

```bash
sudo docker run -d \
  --name sgtm \
  --restart always \
  -e CONTAINER_CONFIG='YOUR_CONTAINER_CONFIG_HERE' \
  -p 8080:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable
```

Health check:
```bash
curl http://localhost:8080/healthz
# Output: ok
```

---

## Preview Server (Port 8081)

```bash
sudo docker run -d \
  --name sgtm-preview \
  --restart always \
  -e CONTAINER_CONFIG='YOUR_CONTAINER_CONFIG_HERE' \
  -e RUN_AS_PREVIEW_SERVER=true \
  -p 8081:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable
```

---

## Preview URL পাওয়ার পরে Tagging Server আবার চালাও

```bash
sudo docker rm -f sgtm

sudo docker run -d \
  --name sgtm \
  --restart always \
  -e CONTAINER_CONFIG='YOUR_CONTAINER_CONFIG_HERE' \
  -e PREVIEW_SERVER_URL='https://YOUR_PREVIEW_TUNNEL_URL' \
  -p 8080:8080 \
  gcr.io/cloud-tagging-10302018/gtm-cloud-image:stable
```
