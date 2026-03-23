# Linux Networking Cheatsheet

## Show Network Info
```bash
ip addr                     # Show all interfaces and IPs
ip addr show eth0           # Show specific interface
ip route                    # Show routing table
cat /etc/resolv.conf        # Show DNS servers
hostname -I                 # Show your IP address
```

## Test Connectivity
```bash
ping google.com             # Ping continuously
ping -c 4 8.8.8.8           # Ping 4 times only
traceroute google.com       # Trace route to host
mtr google.com              # Live traceroute
curl -I https://google.com  # Check HTTP response
```

## DNS Lookup
```bash
nslookup google.com         # DNS query
dig google.com              # Detailed DNS query
dig google.com +short       # Just the IP
host google.com             # Simple lookup
```

## Ports & Connections
```bash
ss -tulpn                   # All listening ports
ss -tulpn | grep :80        # Who is on port 80
lsof -i :80                 # Process using port 80
netstat -tulpn              # Old way (same result)
```

## SSH
```bash
ssh user@host               # Connect to remote
ssh -p 2222 user@host       # Custom port
ssh -i ~/.ssh/key user@host # Use specific key
ssh-keygen -t ed25519       # Generate SSH key
ssh-copy-id user@host       # Copy key to server
```

## Copy Files Over Network
```bash
scp file.txt user@host:/path/       # Upload file
scp user@host:/path/file.txt .      # Download file
scp -r folder/ user@host:/path/     # Upload folder
rsync -avz folder/ user@host:/path/ # Sync folder
```

## Download Files
```bash
curl -O https://example.com/file.zip        # Download file
curl -L https://example.com                 # Follow redirects
wget https://example.com/file.zip           # Download file
wget -r https://example.com                 # Download entire site
```

## Firewall (UFW)
```bash
sudo ufw status             # Check firewall status
sudo ufw enable             # Enable firewall
sudo ufw allow ssh          # Allow SSH
sudo ufw allow 80/tcp       # Allow HTTP
sudo ufw allow 443/tcp      # Allow HTTPS
sudo ufw deny 23            # Block Telnet
sudo ufw status numbered    # Show rules with numbers
sudo ufw delete 3           # Delete rule number 3
```

## NetworkManager
```bash
nmcli device status                                     # Show devices
nmcli device wifi list                                  # List WiFi networks
nmcli device wifi connect "WiFiName" password "pass"    # Connect to WiFi
nmcli connection show                                   # Show connections
```

## Common Ports Reference
| Port | Protocol | Use |
|------|----------|-----|
| 22 | SSH | Secure remote access |
| 80 | HTTP | Web traffic |
| 443 | HTTPS | Secure web traffic |
| 21 | FTP | File transfer |
| 25 | SMTP | Email sending |
| 3306 | MySQL | Database |
| 5432 | PostgreSQL | Database |
| 6379 | Redis | Cache |
| 27017 | MongoDB | Database |
