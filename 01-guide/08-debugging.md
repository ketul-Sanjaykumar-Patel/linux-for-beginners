# Chapter 8 — Debugging & System Troubleshooting

## Log Files — Your Best Friend
```bash
# Main log locations
/var/log/syslog             # General system log (Debian/Ubuntu)
/var/log/messages           # General log (RHEL/CentOS)
/var/log/auth.log           # Authentication/sudo/SSH
/var/log/kern.log           # Kernel messages
/var/log/dmesg              # Boot hardware messages
/var/log/apt/history.log    # APT package history
/var/log/nginx/             # Nginx logs
/var/log/apache2/           # Apache logs

# View logs
tail -f /var/log/syslog             # Live follow system log
journalctl                          # systemd journal (ALL logs)
journalctl -u nginx                 # Logs for nginx service only
journalctl -f                       # Follow live
journalctl --since "1 hour ago"     # Last hour
journalctl --since "2024-01-01" --until "2024-01-02"
journalctl -p err                   # Only errors

# Kernel messages
dmesg                       # Kernel ring buffer
dmesg -T                    # With human readable timestamps
dmesg | grep -i error       # Kernel errors only
```

---

## Debugging Common Problems
```bash
# Out of disk space?
df -h                                       # Find full filesystem
du -sh /* 2>/dev/null | sort -rh | head    # Find biggest dirs
du -sh /var/log/* | sort -rh               # Check log sizes
sudo journalctl --vacuum-size=500M         # Trim journal logs
sudo apt autoremove                        # Remove old packages
sudo apt clean                             # Clear apt cache

# Out of memory?
free -h                         # Check RAM
dmesg | grep -i "oom"           # OOM killer messages
cat /proc/meminfo               # Detailed memory info
top                             # Find memory hogs

# High CPU?
top                             # Press P to sort by CPU
htop                            # Better view
ps aux --sort=-%cpu | head      # Top CPU processes
strace -p PID                   # Trace system calls of a process

# Network not working?
ping 8.8.8.8                    # Can I reach internet?
ping 192.168.1.1                # Can I reach gateway?
ip route                        # Check routing table
cat /etc/resolv.conf            # Check DNS
systemctl restart networking    # Restart networking

# Process stuck or zombie?
ps aux | grep Z                 # Find zombie processes
kill -9 PID                     # Force kill
```

---

## strace — Trace System Calls
```bash
strace ls                       # Trace all system calls of ls
strace -p 1234                  # Attach to running process
strace -e open,read ls          # Only trace open/read calls
strace -o output.txt command    # Save trace to file
```

---

## lsof — List Open Files
```bash
lsof                    # All open files (huge list)
lsof -p 1234            # Open files of process 1234
lsof -u alice           # Files opened by user alice
lsof -i                 # All network connections
lsof -i :80             # Who is using port 80
lsof /var/log/syslog    # Who has this file open
```

---

## Debugging Services
```bash
systemctl status nginx          # Check service status
journalctl -u nginx -n 50       # Last 50 lines of nginx logs
nginx -t                        # Test nginx config syntax
journalctl -xe                  # Extended log on failure

# General debug approach:
# 1. systemctl status <service>
# 2. journalctl -u <service> -f
# 3. Check config file syntax
# 4. Check port conflicts: ss -tulpn
# 5. Check file permissions
# 6. Check firewall: ufw status
```

---

## Performance Analysis
```bash
# CPU profiling
perf top                        # Live CPU performance analysis
perf record -g ./myprogram      # Record performance
perf report                     # Analyze recording

# I/O analysis
iostat -xz 1                    # Disk I/O every 1 second
iotop                           # Live I/O by process
hdparm -t /dev/sda              # Disk read speed test

# Network analysis
iftop                           # Live network usage by connection
nethogs                         # Live bandwidth by process
tcpdump -i eth0                 # Capture all packets
tcpdump -i eth0 port 80         # Capture HTTP only
wireshark                       # GUI packet analyzer

# System benchmarking
sysbench cpu --cpu-max-prime=20000 run      # CPU benchmark
dd if=/dev/zero of=test bs=1G count=1       # Disk write speed
```

---

## System Won't Boot? Recovery Steps
```bash
# At GRUB menu → Advanced options → Recovery mode
# Then choose:
# dpkg  → Fix broken packages
# root  → Drop to root shell

# Once in root shell:
fsck /dev/sda1          # Check and repair filesystem
mount -o remount,rw /   # Remount root as read-write
dpkg --configure -a     # Fix broken packages
apt install -f          # Fix broken dependencies
```

---

## Next Chapter

👉 [Chapter 9 — Shell Scripting](09-shell-scripting.md)