# Intermediate Exercise Answers

## Exercise 1 — Shell Script
```bash
#!/bin/bash
read -p "Enter your name: " NAME
echo "Hello, $NAME! Welcome to Linux."
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
free -h | awk '/Mem/{print "Free RAM: " $4}'
```

## Exercise 2 — Process Management
```bash
sleep 300 &             # Start in background
jobs                    # Shows [1]+ Running sleep 300
ps aux | grep sleep     # Find the process
kill %1                 # Kill job 1
ps aux | grep sleep     # Verify it is gone
```

## Exercise 3 — Log Analysis
```bash
tail -n 20 /var/log/syslog
journalctl --since "1 hour ago" -p err
grep -ic "error" /var/log/syslog
grep -i "error" /var/log/syslog > errors.txt
cat errors.txt
```

## Exercise 4 — User Management
```bash
sudo adduser testuser
sudo passwd testuser
sudo mkdir -p /home/testuser/projects
sudo chown -R testuser:testuser /home/testuser/projects
su - testuser
pwd                     # Should show /home/testuser
ls                      # Should show projects folder
exit                    # Return to your user
```

## Exercise 5 — Cron Job
```bash
crontab -e
# Add: * * * * * date >> /tmp/crontest.txt
# Save and exit

# Wait 2 minutes
sleep 120
cat /tmp/crontest.txt   # Should have 2 timestamps

# Remove the job
crontab -e              # Delete the line
crontab -l              # Verify it is removed
```

## Exercise 6 — Disk & Backup
```bash
du -sh ~
du -sh /var/* 2>/dev/null | sort -rh | head -5
tar -czf ssh-backup.tar.gz /etc/ssh
du -sh ssh-backup.tar.gz
tar -xzf ssh-backup.tar.gz -C /tmp
ls /tmp/etc/ssh         # Verify extraction
```
