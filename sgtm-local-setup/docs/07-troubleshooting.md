# Troubleshooting

## VERR_SVM_DISABLED

VirtualBox এ 64-bit VM চলছে না।

```powershell
bcdedit /set hypervisorlaunchtype off
```
PC restart করো।

---

## Virtualization Enabled In Firmware: No

BIOS এ SVM enable করো: MSI → OC → CPU Features → SVM Mode → Enabled → F10

---

## paste এ অক্ষর বদলে যাচ্ছে

VM: Devices → Shared Clipboard → Bidirectional
Terminal paste: `Ctrl+Shift+V`

---

## Unable to locate package docker-ce

```bash
cat /etc/apt/sources.list.d/docker.list
# arch=amd64 আর noble আছে কিনা দেখো

# ভুল থাকলে মুছে আবার করো
sudo rm -f /etc/apt/sources.list.d/docker*.list
sudo apt-get update
```

---

## container name already in use

```bash
sudo docker rm -f sgtm sgtm-preview
```

---

## HTTP 400 on root URL

স্বাভাবিক। `/healthz` দিয়ে check করো:
```bash
curl http://localhost:8080/healthz
# Output: ok
```

---

## Tag Serving Path কাজ করছে না

Nginx config এ সব path proxy করো:
```nginx
location / {
    proxy_pass http://localhost:8080;
    proxy_set_header Host $host;
}
```
