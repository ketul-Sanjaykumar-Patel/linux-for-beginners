# Chapter 1 — Installing Linux on a Machine

## Step 1: Download a Distro ISO

Go to [ubuntu.com](https://ubuntu.com) → Download Ubuntu → Get the `.iso` file

---

## Step 2: Create a Bootable USB
```bash
# On Linux (replace /dev/sdX with your USB drive)
sudo dd if=ubuntu.iso of=/dev/sdX bs=4M status=progress && sync
```

Or use a GUI tool like **Balena Etcher** (works on Windows/Mac/Linux)
👉 https://www.balena.io/etcher

---

## Step 3: Boot from USB

1. Plug USB into your PC
2. Press **F2, F12, DEL, or ESC** at startup (depends on your board)
3. Enter BIOS/UEFI → change boot order → USB first
4. Save and reboot

---

## Step 4: Ubuntu Installer Walkthrough
```
[ Welcome ]            → Choose Language
[ Keyboard ]           → Choose layout
[ Installation Type ]  → Erase disk and install Ubuntu  ← simplest
[ Time Zone ]          → Select your region
[ User Setup ]         → Enter name, username, password
[ Install ]            → Wait 10-20 minutes
[ Reboot ]             → Remove USB when told
```

---

## Step 5: First Boot — Verify Installation
```bash
uname -a        # Shows kernel version
lsb_release -a  # Shows distro info
df -h           # Shows disk space
free -h         # Shows RAM
lscpu           # Shows CPU info
lsblk           # Shows all disks/partitions
```

---

## Installing on Embedded Boards (Raspberry Pi etc.)
```bash
# Flash image to SD card
sudo dd if=raspbian.img of=/dev/mmcblk0 bs=4M status=progress

# After boot, always update first:
sudo apt update && sudo apt upgrade -y
```

**Common boards:** Raspberry Pi, BeagleBone, Orange Pi, Jetson Nano

---

## Next Chapter

👉 [Chapter 2 — The Linux File System](02-file-system.md)