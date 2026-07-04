# GTM Configuration

## Server Container Settings

1. GTM → Server container → **Admin → Container Settings**
2. **Server container URLs** এ Tagging Server URL বসাও
3. Save করো

---

## Web Container — Google Tag

1. GTM → Web container → Google Tag / GA4 Config tag
2. **Shared event settings → server_container_url**
3. একই Tagging Server URL বসাও
4. Save → Submit → Publish

---

## Client Configuration (sGTM)

GTM Server → **Workspace → Clients → Google Tag Manager: Web Container**

| Field | Value |
|-------|-------|
| Allowed Container IDs | GTM-XXXXXXX |
| Tag Serving Path | Auto-generated |

---

## Same Origin Setup (Cloudflare Worker)

```javascript
// Standard snippet এ পরিবর্তন:
// আগে
'https://www.googletagmanager.com/gtm.js?id=' + i + dl

// পরে (same origin)
'/gtm.js?id=' + i + dl
```

Cloudflare Worker:
```javascript
addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const url = new URL(request.url)
  const targetUrl = 'https://gtm.yourdomain.com' + url.pathname + url.search
  return fetch(new Request(targetUrl, request))
}
```

Worker Routes:
- `yourdomain.com/gtm.js*`
- `yourdomain.com/TAG_SERVING_PATH*`
