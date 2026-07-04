# Windows Setup — VirtualBox + Ubuntu VM

## ধাপ ১ — Hyper-V বন্ধ করো (গুরুত্বপূর্ণ)

VirtualBox এ 64-bit Ubuntu চালাতে Hyper-V বন্ধ করতে হবে।
PowerShell Admin এ:

```powershell
bcdedit /set hypervisorlaunchtype off
```

Confirm:
```powershell
bcdedit /enum | findstr hypervisorlaunchtype
```

`off` দেখালে PC restart করো।

> পরে Docker Desktop / WSL 2 লাগলে: `bcdedit /set hypervisorlaunchtype auto`

---

## ধাপ ২ — VirtualBox Install

- Download: https://www.virtualbox.org/wiki/Downloads
- **Windows hosts** click করো
- Default settings দিয়ে install করো

---

## ধাপ ৩ — Ubuntu VM তৈরি

VirtualBox খুলে **New** click করো:

| Setting | Value |
|---------|-------|
| Name | Ubuntu-sGTM |
| ISO | ubuntu-24.04-desktop-amd64.iso |
| Skip Unattended | tick করো |
| Base Memory | 4096 MB |
| CPUs | 2 |
| Disk Size | 25 GB |
| Use EFI | off |

**Finish** click করো।

---

## ধাপ ৪ — Ubuntu Install

1. VM Start করো
2. "Erase disk and install Ubuntu" select করো
3. Username + Password দাও (মনে রাখো, sudo তে লাগবে)
4. Install শেষে restart করো

---

## ধাপ ৫ — Clipboard Sharing

VM window এ: **Devices → Shared Clipboard → Bidirectional**

Terminal এ paste: `Ctrl+Shift+V`
