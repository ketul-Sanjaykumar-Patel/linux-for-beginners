# Chapter 7 — Kernel & Boot System

## Understanding the Boot Process
```
1. BIOS/UEFI   → Hardware checks, finds bootloader
2. GRUB        → Bootloader, lets you pick OS/kernel
3. Kernel Load → Linux kernel loads into RAM
4. initramfs   → Temporary filesystem to help boot
5. systemd     → First process (PID 1), starts everything
6. Login       → Your terminal or GUI appears
```

---

## GRUB Bootloader
```bash
# GRUB config locations
/boot/grub/grub.cfg         # Main config (don't edit directly)
/etc/default/grub           # THIS is where you edit settings

# After editing /etc/default/grub, apply changes:
sudo update-grub                                        # Debian/Ubuntu
sudo grub2-mkconfig -o /boot/grub2/grub.cfg            # Fedora/CentOS

# Key GRUB settings in /etc/default/grub:
GRUB_DEFAULT=0                          # Which menu entry to boot by default
GRUB_TIMEOUT=5                          # Seconds to show boot menu
GRUB_CMDLINE_LINUX=""                   # Extra kernel parameters
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"  # Normal boot params
```

---

## Kernel Parameters
```bash
# View current kernel parameters
cat /proc/cmdline

# Common kernel boot parameters (add to GRUB_CMDLINE_LINUX):
quiet           # Less boot messages
splash          # Show splash screen
nomodeset       # Disable GPU mode setting (fixes some GPU issues)
mem=4G          # Limit RAM to 4GB
root=/dev/sda1  # Tell kernel where root filesystem is
ro              # Mount root read-only at first
init=/bin/bash  # Emergency: boot directly to shell

# After adding params, always run:
sudo update-grub
```

---

## Kernel Modules
```bash
# Modules are like kernel plugins — add/remove hardware support
lsmod                       # List loaded modules
modinfo module_name         # Info about a module
modprobe module_name        # Load a module
modprobe -r module_name     # Unload a module
rmmod module_name           # Remove module (no dependency check)

# Examples
modprobe bluetooth          # Load Bluetooth support
modprobe -r pcspkr          # Disable PC speaker beep
modprobe usb_storage        # Load USB storage support

# Auto-load modules on boot
echo "module_name" | sudo tee -a /etc/modules

# Blacklist a module (prevent it from loading)
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/blacklist.conf
```

---

## Systemd — The Init System
```bash
# systemd manages ALL services on modern Linux
systemctl status                    # Overall system status
systemctl list-units                # All loaded units
systemctl list-units --failed       # Show failed services

# Service management
systemctl start nginx               # Start nginx
systemctl stop nginx                # Stop nginx
systemctl restart nginx             # Restart nginx
systemctl reload nginx              # Reload config without restart
systemctl enable nginx              # Start nginx at boot
systemctl disable nginx             # Don't start at boot
systemctl status nginx              # Show status + recent logs

# Targets (like old runlevels)
systemctl get-default                           # Current target
systemctl set-default multi-user.target         # Server (no GUI)
systemctl set-default graphical.target          # GUI mode
systemctl isolate rescue.target                 # Emergency mode
```

---

## Create Your Own Systemd Service
```bash
# File: /etc/systemd/system/myapp.service
[Unit]
Description=My Application
After=network.target

[Service]
ExecStart=/usr/bin/python3 /opt/myapp/app.py
Restart=always
User=myappuser

[Install]
WantedBy=multi-user.target

# Load and start it
sudo systemctl daemon-reload
sudo systemctl enable --now myapp
```

---

## Building a Custom Kernel (Advanced)
```bash
# Install build tools
sudo apt install build-essential libncurses-dev bison flex libssl-dev libelf-dev

# Get kernel source
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.x.tar.xz
tar xf linux-6.x.tar.xz
cd linux-6.x

# Configure
make menuconfig         # TUI menu to select features
make defconfig          # Use defaults for your architecture

# Build (replace 8 with your CPU core count)
make -j8                # Build kernel
make -j8 modules        # Build modules

# Install
sudo make modules_install   # Install modules
sudo make install           # Install kernel + update GRUB
sudo reboot
```

---

## Next Chapter

👉 [Chapter 8 — Debugging](08-debugging.md)