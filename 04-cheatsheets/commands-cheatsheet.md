# Linux Commands Cheatsheet

## Navigation
| Command | What it does |
|---------|-------------|
| `pwd` | Show current folder |
| `ls` | List files |
| `ls -la` | List all files with details |
| `cd /etc` | Go to /etc folder |
| `cd ~` | Go to home folder |
| `cd ..` | Go one level up |
| `cd -` | Go to previous folder |

## Files
| Command | What it does |
|---------|-------------|
| `touch file.txt` | Create empty file |
| `mkdir folder` | Create folder |
| `mkdir -p a/b/c` | Create nested folders |
| `cp a.txt b.txt` | Copy file |
| `cp -r folder/ new/` | Copy folder |
| `mv a.txt /tmp/` | Move file |
| `mv old.txt new.txt` | Rename file |
| `rm file.txt` | Delete file |
| `rm -r folder/` | Delete folder |
| `cat file.txt` | Show file contents |
| `less file.txt` | Scroll through file |
| `head -n 20 file` | First 20 lines |
| `tail -n 20 file` | Last 20 lines |
| `tail -f file` | Live follow file |

## Search
| Command | What it does |
|---------|-------------|
| `grep "text" file` | Search in file |
| `grep -r "text" /dir` | Search recursively |
| `find / -name "*.conf"` | Find files by name |
| `locate filename` | Fast file search |
| `which python3` | Find command location |

## Permissions
| Command | What it does |
|---------|-------------|
| `chmod 755 file` | rwxr-xr-x |
| `chmod 644 file` | rw-r--r-- |
| `chmod +x file` | Add execute permission |
| `chmod -w file` | Remove write permission |
| `chown user file` | Change owner |
| `chown user:group file` | Change owner and group |

## Process Management
| Command | What it does |
|---------|-------------|
| `ps aux` | Show all processes |
| `top` | Live process monitor |
| `htop` | Better process monitor |
| `kill 1234` | Stop process by PID |
| `kill -9 1234` | Force kill process |
| `killall nginx` | Kill by name |
| `jobs` | List background jobs |
| `command &` | Run in background |

## Disk
| Command | What it does |
|---------|-------------|
| `df -h` | Disk space usage |
| `du -sh folder/` | Size of folder |
| `lsblk` | List block devices |
| `mount /dev/sdb1 /mnt` | Mount disk |
| `umount /mnt` | Unmount disk |

## Network
| Command | What it does |
|---------|-------------|
| `ip addr` | Show IP addresses |
| `ping google.com` | Test connection |
| `ssh user@host` | Connect remote |
| `scp file user@host:/path` | Copy over SSH |
| `ss -tulpn` | Show listening ports |
| `curl https://example.com` | Fetch URL |
| `wget https://example.com/file` | Download file |

## Users
| Command | What it does |
|---------|-------------|
| `whoami` | Current username |
| `id` | User ID and groups |
| `adduser alice` | Create new user |
| `passwd alice` | Set password |
| `su alice` | Switch to user |
| `sudo command` | Run as root |

## Packages (Ubuntu/Debian)
| Command | What it does |
|---------|-------------|
| `sudo apt update` | Refresh package list |
| `sudo apt install X` | Install package |
| `sudo apt remove X` | Remove package |
| `sudo apt upgrade` | Update everything |
| `apt search X` | Search packages |

## System
| Command | What it does |
|---------|-------------|
| `uname -a` | System info |
| `uptime` | How long running |
| `free -h` | RAM usage |
| `dmesg` | Kernel messages |
| `journalctl -f` | Live system logs |
| `systemctl status X` | Service status |
| `reboot` | Restart system |
| `shutdown -h now` | Shutdown now |
