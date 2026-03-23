# Beginner Linux Exercises

## Exercise 1 — Navigation
1. Open a terminal
2. Find out which folder you are in
3. Go to `/etc`
4. List all files including hidden ones
5. Come back to your home folder

<details>
<summary>💡 Hint</summary>
```bash
pwd
cd /etc
ls -la
cd ~
```
</details>

---

## Exercise 2 — Files
1. Create a folder called `mytest`
2. Go inside it
3. Create 3 files: `a.txt`, `b.txt`, `c.txt`
4. Write "Hello Linux" into `a.txt`
5. Copy `a.txt` to `backup.txt`
6. Delete `c.txt`

<details>
<summary>💡 Hint</summary>
```bash
mkdir mytest
cd mytest
touch a.txt b.txt c.txt
echo "Hello Linux" > a.txt
cp a.txt backup.txt
rm c.txt
```
</details>

---

## Exercise 3 — Permissions
1. Create a file called `script.sh`
2. Write `echo "I am running!"` into it
3. Try to run it — what happens?
4. Give it execute permission
5. Run it again — what happens now?

<details>
<summary>💡 Hint</summary>
```bash
touch script.sh
echo 'echo "I am running!"' > script.sh
./script.sh
chmod +x script.sh
./script.sh
```
</details>

---

## Exercise 4 — System Info
Run commands to find out:
1. What Linux version are you using?
2. How much RAM does your system have?
3. How much disk space is free?
4. How long has your system been running?
5. What is your IP address?

<details>
<summary>💡 Hint</summary>
```bash
uname -a
free -h
df -h
uptime
ip addr
```
</details>

---

## Exercise 5 — Run a Script
1. Clone this repo
2. Go into `02-scripts/`
3. Run the `system-info.sh` script
4. Read the output — what do you learn?
```bash
git clone https://github.com/ketul-Sanjaykumar-Patel/linux-for-beginners.git
cd linux-for-beginners/02-scripts
bash system-info.sh
```

---

## Exercise 6 — Search & Filter
1. Search for the word "root" in `/etc/passwd`
2. Count how many lines contain "root"
3. Show only the first 5 lines of `/etc/passwd`
4. Find all `.conf` files in `/etc`

<details>
<summary>💡 Hint</summary>
```bash
grep "root" /etc/passwd
grep -c "root" /etc/passwd
head -n 5 /etc/passwd
find /etc -name "*.conf"
```
</details>
