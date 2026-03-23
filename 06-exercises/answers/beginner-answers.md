# Beginner Exercise Answers

## Exercise 1 — Navigation
```bash
pwd                 # Shows current directory
cd /etc             # Go to /etc
ls -la              # List all files with details
cd ~                # Return home
```

## Exercise 2 — Files
```bash
mkdir mytest
cd mytest
touch a.txt b.txt c.txt
echo "Hello Linux" > a.txt
cp a.txt backup.txt
rm c.txt
ls                  # Verify: should show a.txt b.txt backup.txt
```

## Exercise 3 — Permissions
```bash
touch script.sh
echo 'echo "I am running!"' > script.sh
./script.sh         # Permission denied
chmod +x script.sh
./script.sh         # I am running!
ls -la script.sh    # Should show -rwxr-xr-x
```

## Exercise 4 — System Info
```bash
uname -a            # Full system info
free -h             # RAM usage
df -h               # Disk space
uptime              # System uptime
ip addr             # IP address
```

## Exercise 5 — Run a Script
```bash
git clone https://github.com/ketul-Sanjaykumar-Patel/linux-for-beginners.git
cd linux-for-beginners/02-scripts
bash system-info.sh
# Output shows OS, CPU, memory, disk and network info
```

## Exercise 6 — Search & Filter
```bash
grep "root" /etc/passwd             # Lines with root
grep -c "root" /etc/passwd          # Count of matches
head -n 5 /etc/passwd               # First 5 lines
find /etc -name "*.conf"            # All .conf files
```
