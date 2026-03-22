# Chapter 10 — Modern Linux / DevOps / Cloud

## Docker — Containers
```bash
# Install Docker
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER   # Add yourself to docker group
# Log out and back in

# Basic Docker commands
docker pull ubuntu          # Download Ubuntu image
docker images               # List downloaded images
docker ps                   # Running containers
docker ps -a                # All containers (including stopped)

# Run containers
docker run ubuntu echo "hello"          # Run command in container
docker run -it ubuntu bash              # Interactive shell
docker run -d nginx                     # Run nginx in background
docker run -d -p 8080:80 nginx         # Map port 8080 → container port 80

# Full example with options
docker run -d \
    --name myapp \
    -p 3000:3000 \
    -v /host/data:/app/data \
    -e DB_HOST=localhost \
    myimage

# Manage containers
docker stop myapp           # Stop container
docker start myapp          # Start stopped container
docker restart myapp        # Restart
docker rm myapp             # Remove container
docker logs myapp           # View container logs
docker logs -f myapp        # Follow live logs
docker exec -it myapp bash  # Shell inside running container
```

---

## Dockerfile — Build Your Own Image
```dockerfile
FROM ubuntu:22.04
RUN apt update && apt install -y python3 pip
WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
EXPOSE 5000
CMD ["python3", "app.py"]
```
```bash
docker build -t myapp:1.0 .     # Build image
docker push myapp:1.0           # Push to Docker Hub
```

---

## Docker Compose — Multi-Container Apps
```yaml
# docker-compose.yml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html

  db:
    image: postgres:14
    environment:
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: mydb
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```
```bash
docker compose up -d        # Start all services
docker compose down         # Stop all services
docker compose logs -f      # Follow logs
docker compose ps           # Show status
```

---

## Git — Version Control
```bash
# Setup
git config --global user.name "Your Name"
git config --global user.email "you@email.com"

# Basic workflow
git init                            # Start new repo
git clone https://github.com/user/repo  # Clone existing
git status                          # What's changed?
git add file.txt                    # Stage file
git add .                           # Stage everything
git commit -m "Add new feature"     # Commit with message
git push origin main                # Push to remote

# Branching
git branch                          # List branches
git branch feature-x                # Create branch
git checkout feature-x              # Switch to branch
git checkout -b feature-y           # Create + switch
git merge feature-x                 # Merge into current branch
git branch -d feature-x             # Delete branch

# History
git log                             # Commit history
git log --oneline                   # Compact history
git diff                            # Unstaged changes
git diff HEAD~1                     # Compare with previous commit

# Fix mistakes
git restore file.txt                # Undo changes to file
git reset --soft HEAD~1             # Undo last commit, keep changes
git reset --hard HEAD~1             # Undo last commit, LOSE changes
```

---

## Systemd Timers — Modern Alternative to Cron
```bash
# Create timer: /etc/systemd/system/backup.timer
[Unit]
Description=Daily Backup Timer

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target

# Create matching service: /etc/systemd/system/backup.service
[Unit]
Description=Run Backup

[Service]
ExecStart=/usr/local/bin/backup.sh

# Enable timer
sudo systemctl daemon-reload
sudo systemctl enable --now backup.timer
systemctl list-timers           # View all active timers
```

---

## Monitoring Stack
```bash
# Prometheus + Grafana (modern monitoring)
# Quick setup with Docker:
docker run -d -p 9090:9090 \
    -v ./prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus

docker run -d -p 3000:3000 grafana/grafana

# Node Exporter (system metrics for Prometheus)
docker run -d \
    --net="host" \
    --pid="host" \
    -v "/:/host:ro,rslave" \
    prom/node-exporter
```

---

## Quick Reference — 50 Most Important Commands
```bash
# Navigation
pwd, ls, ls -la, cd, cd ~, cd ..

# Files
touch, mkdir, cp, mv, rm, rm -r, cat, less, head, tail, nano, vim

# Search
find, grep, locate, which, whereis

# Permissions
chmod, chown, sudo, su

# Process
ps aux, top, htop, kill, killall, jobs, bg, fg

# Disk
df -h, du -sh, lsblk, mount, umount, fdisk

# Network
ip addr, ping, ssh, scp, curl, wget, ss -tulpn

# Users
adduser, deluser, passwd, id, groups, who, w

# Packages
apt update, apt install, apt remove, apt upgrade

# System
uname -a, uptime, dmesg, journalctl, systemctl

# Text processing
cat, grep, sed, awk, sort, uniq, cut, wc, head, tail
```

---

## Your Learning Path
```
Week 1: Chapter 0-2  → Navigation, files, permissions
Week 2: Chapter 3-4  → I/O, essential commands
Week 3: Chapter 5-6  → Configuration, kernel basics
Week 4: Chapter 7-8  → Packages, networking, SSH
Week 5: Chapter 9    → Debugging, logs, troubleshooting
Week 6: Chapter 10   → Shell scripting
Week 7: Chapter 11   → Docker, Git, modern DevOps
Week 8+: Practice    → Build real projects on Linux
```

---

## 🎉 You made it through the full guide!

Go back to the [main README](../README.md) to explore scripts, cheatsheets, and exercises.