# Intermediate Linux Exercises

## Exercise 1 — Shell Script
Write a script called `greet.sh` that:
1. Asks the user for their name
2. Says "Hello, [name]! Welcome to Linux."
3. Shows the current date and time
4. Shows how much free RAM is available

<details>
<summary>💡 Hint</summary>
```bash
#!/bin/bash
read -p "Enter your name: " NAME
echo "Hello, $NAME! Welcome to Linux."
echo "Date: $(date)"
free -h | awk '/Mem/{print "Free RAM: " $4}'
```
</details>

---

## Exercise 2 — Process Management
1. Start a background process: `sleep 300 &`
2. Find its PID
3. Check it with `ps aux`
4. Kill it gracefully
5. Verify it is gone

<details>
<summary>💡 Hint</summary>
```bash
sleep 300 &
jobs
ps aux | grep sleep
kill %1
ps aux | grep sleep
```
</details>

---

## Exercise 3 — Log Analysis
1. View the last 20 lines of `/var/log/syslog`
2. Search for any errors in the last hour
3. Count how many times "error" appears
4. Save all errors to a file called `errors.txt`

<details>
<summary>💡 Hint</summary>
```bash
tail -n 20 /var/log/syslog
journalctl --since "1 hour ago" -p err
grep -ic "error" /var/log/syslog
grep -i "error" /var/log/syslog > errors.txt
```
</details>

---

## Exercise 4 — User Management
1. Create a new user called `testuser`
2. Set a password for them
3. Create a folder `/home/testuser/projects`
4. Give testuser ownership of that folder
5. Switch to testuser and verify

<details>
<summary>💡 Hint</summary>
```bash
sudo adduser testuser
sudo passwd testuser
sudo mkdir /home/testuser/projects
sudo chown testuser:testuser /home/testuser/projects
su - testuser
```
</details>

---

## Exercise 5 — Cron Job
1. Open your crontab
2. Add a job that runs every minute and saves the date to `/tmp/crontest.txt`
3. Wait 2 minutes
4. Check the file — did it work?
5. Remove the cron job

<details>
<summary>💡 Hint</summary>
```bash
crontab -e
# Add this line:
* * * * * date >> /tmp/crontest.txt

# Wait 2 minutes then:
cat /tmp/crontest.txt

# Remove job:
crontab -e
# Delete the line
```
</details>

---

## Exercise 6 — Disk & Backup
1. Check disk usage of your home folder
2. Find the 5 biggest files in `/var`
3. Create a compressed backup of `/etc/ssh`
4. Check the size of your backup
5. Extract it to `/tmp`

<details>
<summary>💡 Hint</summary>
```bash
du -sh ~
du -sh /var/* 2>/dev/null | sort -rh | head -5
tar -czf ssh-backup.tar.gz /etc/ssh
du -sh ssh-backup.tar.gz
tar -xzf ssh-backup.tar.gz -C /tmp
```
</details>
