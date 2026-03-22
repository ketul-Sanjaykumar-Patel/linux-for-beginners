# Chapter 2 — The Linux File System

## The Directory Tree — Everything is a File in Linux
```
/                   ← Root of everything
├── bin/            ← Essential commands (ls, cp, mv)
├── boot/           ← Kernel and bootloader files
├── dev/            ← Device files (disks, USB, tty)
├── etc/            ← All configuration files
├── home/           ← User home directories
│   └── yourname/  ← YOUR personal folder
├── lib/            ← System libraries
├── media/          ← Auto-mounted drives (USB, CD)
├── mnt/            ← Manually mounted drives
├── opt/            ← Optional/third-party software
├── proc/           ← Virtual: live kernel/process info
├── root/           ← Root user's home
├── run/            ← Runtime data (PIDs, sockets)
├── sbin/           ← System admin commands
├── tmp/            ← Temporary files (cleared on reboot)
├── usr/            ← User programs and libraries
└── var/            ← Variable data: logs, caches, mail
```

---

## Essential Navigation Commands
```bash
pwd         # Print Working Directory — where am I?
ls          # List files
ls -la      # List ALL files with details + hidden
ls -lh      # Human readable sizes
cd /etc     # Change to /etc directory
cd ~        # Go to your home directory
cd ..       # Go one level up
cd -        # Go back to previous directory
```

---

## File Operations
```bash
# Create
touch file.txt          # Create empty file
mkdir myfolder          # Create directory
mkdir -p a/b/c          # Create nested directories

# Copy & Move
cp file.txt backup.txt  # Copy file
cp -r folder/ newfolder/ # Copy entire folder
mv file.txt /tmp/       # Move file
mv old.txt new.txt      # Rename file

# Delete
rm file.txt             # Delete file
rm -r folder/           # Delete folder recursively
rm -rf folder/          # Force delete (BE CAREFUL)

# View Files
cat file.txt            # Print entire file
less file.txt           # Scroll through file (q to quit)
head -n 20 file.txt     # First 20 lines
tail -n 20 file.txt     # Last 20 lines
tail -f logfile.log     # Live follow a log file

# Find Files
find / -name "*.conf"           # Find all .conf files
find /home -type f -size +10M   # Files bigger than 10MB
locate filename                 # Fast search (uses database)
which python3                   # Find where a command lives
```

---

## Disk & Storage Management
```bash
lsblk               # List all block devices (disks)
fdisk -l            # Detailed disk partition list (root needed)
df -h               # Disk usage of mounted filesystems
du -sh folder/      # Size of a folder
du -sh *            # Size of everything in current directory

# Mount a disk manually
mount /dev/sdb1 /mnt/usb   # Mount USB to /mnt/usb
umount /mnt/usb             # Unmount

# Format a disk (DESTROYS DATA)
mkfs.ext4 /dev/sdb1         # Format as ext4
mkfs.vfat /dev/sdb1         # Format as FAT32 (for USB)

# Check disk health
fsck /dev/sdb1              # Check and repair filesystem
smartctl -a /dev/sda        # SMART health data
```

---

## Input / Output Redirection
```bash
command > file.txt      # Redirect stdout to file (overwrite)
command >> file.txt     # Append stdout to file
command 2> error.log    # Redirect errors to file
command 2>&1            # Merge stderr into stdout
command &> all.log      # Both stdout and stderr to file

# Pipes — send output of one command into another
ls -la | grep ".txt"        # Filter ls output
cat file | sort | uniq      # Sort and remove duplicates
ps aux | grep nginx         # Find nginx processes
dmesg | tail -50            # Last 50 kernel messages

# /dev/null — the black hole
command > /dev/null 2>&1    # Discard all output silently
```

---

## Next Chapter

👉 [Chapter 3 — Basic Commands](03-basic-commands.md)