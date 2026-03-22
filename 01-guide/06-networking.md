# Chapter 6 — Networking

## Network Configuration
```bash
# Show network interfaces
ip addr                     # Modern way (replaces ifconfig)
ip addr show eth0           # Specific interface
ifconfig                    # Old way (still works)

# Show routing table
ip route                    # Modern
route -n                    # Old way

# Test connectivity
ping google.com             # Ping
ping -c 4 8.8.8.8           # Ping 4 times only
traceroute google.com       # Trace route to host
mtr google.com              # Live traceroute

# DNS lookup
nslookup google.com         # DNS query
dig google.com              # Detailed DNS query
host google.com             # Simple DNS lookup
cat /etc/resolv.conf        # Your DNS servers

# Ports and connections
ss -tulpn                   # Show listening ports + process
netstat -tulpn              # Old way
lsof -i :80                 # What's using port 80
```

---

## NetworkManager
```bash
nmcli device status                             # Show all network devices
nmcli connection show                           # Show all connections
nmcli device wifi list                          # List WiFi networks
nmcli device wifi connect "MyWifi" password "mypass"  # Connect to WiFi
nmcli connection up eth0                        # Bring up connection
nmcli connection down eth0                      # Bring down connection
```

---

## Set Static IP via Netplan (Ubuntu)
```yaml
# Edit /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses: [192.168.1.100/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```
```bash
sudo netplan apply          # Apply changes
```

---

## SSH — Secure Shell
```bash
# Connect to remote machine
ssh username@192.168.1.50
ssh -p 2222 username@server.com     # Custom port
ssh -i ~/.ssh/mykey.pem user@host   # Use private key

# Generate SSH key pair
ssh-keygen -t ed25519 -C "my@email.com"
# Creates: ~/.ssh/id_ed25519 (private) + ~/.ssh/id_ed25519.pub (public)

# Copy your public key to server (enables passwordless login)
ssh-copy-id username@server.com

# SSH config (~/.ssh/config) — shortcuts
Host myserver
    HostName 192.168.1.50
    User alice
    Port 22
    IdentityFile ~/.ssh/id_ed25519
# Now just type: ssh myserver

# SSH tunneling
ssh -L 8080:localhost:80 user@server    # Local port forward
ssh -R 9090:localhost:3000 user@server  # Remote port forward
```

---

## SCP & Rsync — Copy Files Over SSH
```bash
# SCP
scp file.txt user@server:/home/user/        # Upload file
scp user@server:/var/log/app.log .          # Download file
scp -r folder/ user@server:/opt/            # Upload folder

# rsync — smarter sync
rsync -avz folder/ user@server:/backup/             # Sync folder
rsync -avz --progress user@server:/data/ local/     # Download with progress
```

---

## Firewall — UFW
```bash
sudo ufw status             # Check status
sudo ufw enable             # Enable firewall
sudo ufw disable            # Disable firewall

# Allow / Deny rules
sudo ufw allow ssh          # Allow SSH (port 22)
sudo ufw allow 80/tcp       # Allow HTTP
sudo ufw allow 443/tcp      # Allow HTTPS
sudo ufw allow 8080         # Allow port 8080
sudo ufw deny 23            # Block Telnet
sudo ufw delete allow 80    # Remove a rule

# Allow from specific IP only
sudo ufw allow from 192.168.1.0/24 to any port 22

# See rules with numbers
sudo ufw status numbered
sudo ufw delete 3           # Delete rule number 3
```

---

## Security Best Practices
```bash
# Keep system updated
sudo apt update && sudo apt upgrade -y

# Check failed login attempts
sudo cat /var/log/auth.log | grep "Failed"
sudo lastb                  # Failed login attempts

# Check open ports
sudo ss -tulpn

# Disable root SSH login
# Edit /etc/ssh/sshd_config:
PermitRootLogin no
PasswordAuthentication no   # Force key-only auth
sudo systemctl restart sshd

# Install Fail2ban — blocks brute force attacks
sudo apt install fail2ban
sudo systemctl enable --now fail2ban
sudo fail2ban-client status sshd    # Check SSH bans
```

---

## Next Chapter

👉 [Chapter 7 — Kernel & Boot](07-kernel-and-boot.md)