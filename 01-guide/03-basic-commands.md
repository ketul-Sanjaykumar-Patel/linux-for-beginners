# Chapter 3 — Linux Basic Commands

## Shell Basics
```bash
# What shell am I using?
echo $SHELL         # Usually /bin/bash or /bin/zsh

# Run command as superuser
sudo command        # Run one command as root
sudo su             # Switch to root (careful!)
sudo -i             # Root login shell

# Command history
history             # Show all past commands
!!                  # Repeat last command
!50                 # Run command #50 from history
# Ctrl+R            # Search command history

# Multiple commands
cmd1 ; cmd2         # Run cmd2 after cmd1 (always)
cmd1 && cmd2        # Run cmd2 only if cmd1 succeeds
cmd1 || cmd2        # Run cmd2 only if cmd1 FAILS
cmd &               # Run cmd in background
```

---

## Text Processing — The Power Commands
```bash
# grep — Search inside files
grep "error" logfile.log        # Search for "error"
grep -i "error" logfile.log     # Case insensitive
grep -r "TODO" /home/project/   # Recursive search
grep -n "error" file            # Show line numbers
grep -v "info" file             # Show lines WITHOUT "info"

# sed — Stream Editor (find and replace)
sed 's/old/new/' file.txt       # Replace first occurrence
sed 's/old/new/g' file.txt      # Replace all occurrences
sed -i 's/old/new/g' file.txt   # Edit file in place
sed -n '5,10p' file.txt         # Print lines 5 to 10
sed '/pattern/d' file.txt       # Delete lines matching pattern

# awk — Column and data processing
awk '{print $1}' file.txt               # Print first column
awk '{print $1, $3}' file.txt           # Print columns 1 and 3
awk -F: '{print $1}' /etc/passwd        # Use : as delimiter
awk 'NR>5' file.txt                     # Skip first 5 lines
awk '{sum+=$1} END{print sum}'          # Sum first column

# sort, uniq, cut, wc
sort file.txt               # Alphabetical sort
sort -n numbers.txt         # Numerical sort
sort -r file.txt            # Reverse sort
uniq file.txt               # Remove adjacent duplicates
sort file | uniq -c         # Count occurrences
cut -d: -f1 /etc/passwd     # Cut field 1 using : delimiter
wc -l file.txt              # Count lines
wc -w file.txt              # Count words
```

---

## Process Management
```bash
ps aux                      # Show all running processes
ps aux | grep nginx         # Find specific process
top                         # Live process monitor
htop                        # Better live monitor (install first)
pgrep nginx                 # Get PID of nginx
pidof apache2               # Get PID of apache2

# Kill processes
kill 1234                   # Gracefully stop process 1234
kill -9 1234                # Force kill (SIGKILL)
killall nginx               # Kill all processes named nginx
pkill -f "python script.py" # Kill by command pattern

# Background jobs
command &       # Start in background
jobs            # List background jobs
fg %1           # Bring job 1 to foreground
bg %1           # Send job 1 to background
nohup command & # Run even after you logout
disown %1       # Detach job from shell
screen          # Persistent terminal sessions
tmux            # Modern terminal multiplexer
```

---

## System Information Commands
```bash
uname -a        # Full system/kernel info
uname -r        # Kernel version only
hostnamectl     # System hostname and OS info
uptime          # How long system has been running
who             # Who is logged in
w               # Who is logged in + what they're doing
last            # Login history
id              # Your user ID and groups
groups          # Your groups

# Hardware info
lscpu           # CPU details
lsmem           # Memory info
lsblk           # Block devices (disks)
lspci           # PCI devices (GPU, network cards)
lsusb           # USB devices
dmidecode       # Detailed hardware DMI/BIOS info

# Memory
free -h         # RAM and swap usage
vmstat          # Virtual memory stats
cat /proc/meminfo # Detailed memory info

# CPU
top             # Live CPU usage
mpstat          # Multi-processor stats
cat /proc/cpuinfo # Raw CPU info

# Disk I/O
iostat          # Disk I/O stats
iotop           # Live disk I/O by process
```

---

## Getting Help
```bash
man ls          # Manual page for ls
ls --help       # Quick help
apropos keyword # Search manual pages by keyword
whatis ls       # One-line description
tldr ls         # Simplified examples (install tldr first)
```

---

## Next Chapter

👉 [Chapter 4 — Permissions](04-permissions.md)