# Chapter 5 — Users & Groups

## User Management
```bash
# Add users
adduser alice                       # Interactive user creation (recommended)
useradd -m -s /bin/bash alice       # Non-interactive
passwd alice                        # Set password for alice

# Remove users
deluser alice                       # Remove user
deluser --remove-home alice         # Remove user + home folder

# Modify users
usermod -aG sudo alice              # Add alice to sudo group
usermod -s /bin/zsh alice           # Change alice's shell
usermod -l newname alice            # Rename user

# Switch users
su alice                            # Switch to alice
su -                                # Switch to root
sudo -u alice command               # Run command as alice
```

---

## Group Management
```bash
addgroup developers                 # Create group
usermod -aG developers alice        # Add alice to group
gpasswd -d alice developers         # Remove alice from group
id alice                            # Show alice's user ID and groups
groups alice                        # Show alice's groups
cat /etc/group                      # List all groups
```

---

## Important System Files
```bash
# View user accounts
cat /etc/passwd
# Format: username:x:UID:GID:comment:home:shell
# Example: alice:x:1001:1001:Alice:/home/alice:/bin/bash

# View encrypted passwords (root only)
sudo cat /etc/shadow

# View all groups
cat /etc/group
# Format: groupname:x:GID:members
```

---

## Environment Variables
```bash
env                     # Show all environment variables
echo $PATH              # Show your PATH
echo $HOME              # Your home directory
echo $USER              # Your username

# Set temporary variable (this session only)
export MY_VAR="hello"
echo $MY_VAR

# Set permanent variable (add to ~/.bashrc)
echo 'export MY_VAR="hello"' >> ~/.bashrc
source ~/.bashrc        # Reload .bashrc

# Add something to PATH permanently
echo 'export PATH=$PATH:/opt/mytool/bin' >> ~/.bashrc
source ~/.bashrc

# Key variables:
# $PATH    → Where shell looks for commands
# $HOME    → /home/username
# $SHELL   → Your shell (/bin/bash)
# $EDITOR  → Default text editor
# $LANG    → Language/locale setting
```

---

## Cron — Scheduled Tasks
```bash
crontab -e      # Edit your cron jobs
crontab -l      # List your cron jobs
crontab -r      # Remove all your cron jobs

# Cron format:
# * * * * * command
# │ │ │ │ └── Day of week (0-7, 0=Sunday)
# │ │ │ └──── Month (1-12)
# │ │ └────── Day of month (1-31)
# │ └──────── Hour (0-23)
# └────────── Minute (0-59)

# Examples:
0 2 * * *   /usr/bin/backup.sh    # Every day at 2:00 AM
*/5 * * * * /usr/bin/check.sh     # Every 5 minutes
0 9 * * 1   /usr/bin/report.sh    # Every Monday at 9 AM
0 0 1 * *   /usr/bin/monthly.sh   # First of every month

# System cron folders
/etc/cron.daily/    # Scripts run daily
/etc/cron.weekly/   # Scripts run weekly
/etc/cron.monthly/  # Scripts run monthly
```

---

## Text Editors in Linux
```bash
# Nano — Beginner friendly
nano file.txt
# Ctrl+S = Save
# Ctrl+X = Exit
# Ctrl+W = Search

# Vim — Powerful, steep learning curve
vim file.txt
# i       = Insert mode
# Esc     = Normal mode
# :w      = Save
# :q      = Quit
# :wq     = Save & Quit
# :q!     = Force quit without saving
# dd      = Delete line
# yy      = Copy line
# p       = Paste
# /word   = Search

# VS Code (GUI)
code .          # Open current directory in VS Code
```

---

## Next Chapter

👉 [Chapter 6 — Networking](06-networking.md)