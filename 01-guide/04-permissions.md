# Chapter 4 — Linux Permissions

## Understanding Permissions
```bash
ls -la
# Output example:
# -rwxr-xr-- 1 alice staff 1234 Mar 21 file.sh

# Permission breakdown:
# -  rwx  r-x  r--
# │   │    │    └── Others (everyone else)
# │   │    └─────── Group
# │   └──────────── Owner (user)
# └──────────────── File type: - = file, d = dir, l = link

# r = read (4)
# w = write (2)
# x = execute (1)
```

---

## Permission Table

| Number | Permission | Meaning |
|--------|-----------|---------|
| 7 | rwx | Read, write, execute |
| 6 | rw- | Read and write |
| 5 | r-x | Read and execute |
| 4 | r-- | Read only |
| 3 | -wx | Write and execute |
| 2 | -w- | Write only |
| 1 | --x | Execute only |
| 0 | --- | No permissions |

---

## chmod — Change Permissions
```bash
# Using numbers (octal)
chmod 755 script.sh     # rwxr-xr-x → owner all, group/others read+exec
chmod 644 file.txt      # rw-r--r-- → owner read/write, others read only
chmod 600 secret.txt    # rw------- → owner only, nobody else
chmod 777 file.sh       # rwxrwxrwx → everyone full access (avoid this)

# Using symbols
chmod +x script.sh      # Add execute permission
chmod -w file.txt       # Remove write permission
chmod u+x file.sh       # Add execute for owner only
chmod g-w file.txt      # Remove write from group
chmod o-r file.txt      # Remove read from others

# Recursive (apply to folder and everything inside)
chmod -R 755 myfolder/
```

---

## chown — Change Owner
```bash
chown alice file.txt            # Change owner to alice
chown alice:staff file.txt      # Change owner and group
chown -R alice myfolder/        # Recursively change ownership
chgrp staff file.txt            # Change group only
```

---

## Common Permission Examples
```bash
# Script you want to run
chmod +x myscript.sh
./myscript.sh

# Private key file (SSH requires this)
chmod 600 ~/.ssh/id_ed25519

# Public web folder
chmod 755 /var/www/html/

# Config file (readable by owner only)
chmod 600 config.yaml

# Shared folder (everyone can read)
chmod 644 readme.txt
```

---

## Special Permissions
```bash
# SUID — run file as owner, not current user
chmod u+s /usr/bin/passwd   # passwd always runs as root
# Shows as: -rwsr-xr-x

# SGID — new files inherit group
chmod g+s /shared/folder/
# Shows as: drwxr-sr-x

# Sticky bit — only owner can delete their files
chmod +t /tmp/
# Shows as: drwxrwxrwt
```

---

## sudo — Run as Root
```bash
sudo command            # Run one command as root
sudo apt install nginx  # Install software (needs root)
sudo -i                 # Open root shell (careful!)
sudo su                 # Switch to root user
exit                    # Leave root shell

# Give a user sudo access
usermod -aG sudo alice  # Debian/Ubuntu
usermod -aG wheel alice # Fedora/CentOS

# Edit sudoers file safely
sudo visudo
```

---

## Next Chapter

👉 [Chapter 5 — Users & Groups](05-users-and-groups.md)