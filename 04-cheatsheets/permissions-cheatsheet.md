# Linux Permissions Cheatsheet

## Reading Permissions
```bash
ls -la
# -rwxr-xr-- 1 alice staff 1234 Mar 21 file.sh
#  ↑↑↑↑↑↑↑↑↑
#  │└──────── permissions (9 characters)
#  └───────── file type: - = file, d = dir, l = link

# Permission groups:
# rwx   r-x   r--
#  │     │     └── Others (everyone else)
#  │     └──────── Group
#  └────────────── Owner (user)

# Permission values:
# r = read    = 4
# w = write   = 2
# x = execute = 1
# - = none    = 0
```

## Permission Numbers
| Number | Letters | Meaning |
|--------|---------|---------|
| 7 | rwx | Read + Write + Execute |
| 6 | rw- | Read + Write |
| 5 | r-x | Read + Execute |
| 4 | r-- | Read only |
| 3 | -wx | Write + Execute |
| 2 | -w- | Write only |
| 1 | --x | Execute only |
| 0 | --- | No permissions |

## Common chmod Values
| Command | Result | Use case |
|---------|--------|----------|
| `chmod 755 file` | rwxr-xr-x | Scripts, programs |
| `chmod 644 file` | rw-r--r-- | Normal files |
| `chmod 600 file` | rw------- | Private files |
| `chmod 777 file` | rwxrwxrwx | Avoid! |
| `chmod 400 file` | r-------- | Read-only private |

## chmod Examples
```bash
# Using numbers
chmod 755 script.sh         # Owner all, others read+exec
chmod 644 readme.txt        # Owner read/write, others read
chmod 600 ~/.ssh/id_ed25519 # SSH key — owner only
chmod 700 private_folder/   # Folder — owner only

# Using symbols
chmod +x script.sh          # Add execute for everyone
chmod -w file.txt           # Remove write for everyone
chmod u+x file.sh           # Add execute for owner only
chmod g-w file.txt          # Remove write from group
chmod o-r file.txt          # Remove read from others
chmod a+r file.txt          # Add read for all (a = all)

# Recursive
chmod -R 755 /var/www/      # Apply to folder + contents
```

## chown Examples
```bash
chown alice file.txt            # Change owner to alice
chown alice:developers file.txt # Change owner and group
chown -R alice /home/alice/     # Recursive ownership change
chgrp developers file.txt       # Change group only
```

## sudo
```bash
sudo command                # Run one command as root
sudo -i                     # Open root shell
sudo su                     # Switch to root
sudo -u alice command       # Run command as alice
visudo                      # Safely edit sudoers file

# Give user sudo access
usermod -aG sudo alice      # Debian/Ubuntu
usermod -aG wheel alice     # Fedora/CentOS
```

## Special Permissions
| Permission | Octal | Meaning |
|-----------|-------|---------|
| SUID | 4000 | Run as file owner |
| SGID | 2000 | Run as group / inherit group |
| Sticky | 1000 | Only owner can delete |
```bash
chmod u+s file      # Set SUID
chmod g+s folder    # Set SGID
chmod +t /tmp/      # Set sticky bit
```
