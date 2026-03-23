# Raspberry Pi Setup Guide

## What You Need
- Raspberry Pi (any model)
- MicroSD card (16GB+)
- Power supply
- HDMI cable + monitor (first boot)
- USB keyboard

## Step 1 — Flash the SD Card

Download Raspberry Pi Imager from:
👉 https://www.raspberrypi.com/software/

Or flash manually:
```bash
# On Linux
sudo dd if=raspios.img of=/dev/mmcblk0 bs=4M status=progress
sync
```

## Step 2 — Enable SSH Before First Boot
```bash
# Mount the SD card boot partition then:
touch /mnt/boot/ssh               # Creates empty ssh file = enables SSH
```

## Step 3 — First Boot
```bash
# Default credentials
username: pi
password: raspberry

# ALWAYS change password immediately
passwd

# Update everything
sudo apt update && sudo apt upgrade -y
```

## Step 4 — Essential Configuration
```bash
sudo raspi-config
# Choose:
# 1 → System Options → Hostname (rename your Pi)
# 1 → System Options → Password (change password)
# 3 → Interface Options → SSH (enable)
# 3 → Interface Options → I2C (enable if needed)
# 3 → Interface Options → SPI (enable if needed)
# 3 → Interface Options → Serial (enable if needed)
# 5 → Localisation Options → Timezone
```

## Step 5 — Connect Over SSH
```bash
# From your computer
ssh pi@raspberrypi.local
# Or use IP address
ssh pi@192.168.1.X
```

## GPIO Pin Reference
```
3.3V  → Pin 1  | Pin 2  → 5V
GPIO2 → Pin 3  | Pin 4  → 5V
GPIO3 → Pin 5  | Pin 6  → GND
GPIO4 → Pin 7  | Pin 8  → GPIO14 (TX)
GND   → Pin 9  | Pin 10 → GPIO15 (RX)
GPIO17→ Pin 11 | Pin 12 → GPIO18
GPIO27→ Pin 13 | Pin 14 → GND
GPIO22→ Pin 15 | Pin 16 → GPIO23
3.3V  → Pin 17 | Pin 18 → GPIO24
GPIO10→ Pin 19 | Pin 20 → GND
GPIO9 → Pin 21 | Pin 22 → GPIO25
GPIO11→ Pin 23 | Pin 24 → GPIO8
GND   → Pin 25 | Pin 26 → GPIO7
```

## Useful Commands for Pi
```bash
vcgencmd measure_temp       # CPU temperature
vcgencmd get_throttled      # Check if throttling
pinout                      # Show GPIO pinout diagram
gpio readall                # Read all GPIO states
```
