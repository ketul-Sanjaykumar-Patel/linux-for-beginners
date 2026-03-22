# Chapter 9 — Shell Scripting & Automation

## Your First Script
```bash
#!/bin/bash
# This line is called "shebang" — tells system to use bash

echo "Hello, World!"
echo "I am $(whoami)"
echo "Today is $(date)"

# Save as hello.sh, then:
chmod +x hello.sh   # Make executable
./hello.sh          # Run it
```

---

## Variables & Input
```bash
#!/bin/bash

# Variables
NAME="Alice"
AGE=25
echo "Name: $NAME, Age: $AGE"

# User input
read -p "Enter your name: " USERNAME
echo "Hello, $USERNAME!"

# Command output as variable
KERNEL=$(uname -r)
FILES=$(ls | wc -l)
echo "Kernel: $KERNEL, Files in dir: $FILES"
```

---

## Conditionals
```bash
#!/bin/bash

# if / elif / else
if [ "$1" == "hello" ]; then
    echo "You said hello!"
elif [ "$1" == "bye" ]; then
    echo "Goodbye!"
else
    echo "Unknown: $1"
fi

# Number comparisons
X=10
if [ $X -gt 5 ]; then      # -gt = greater than
    echo "X is big"
fi
# -eq = equal
# -ne = not equal
# -lt = less than
# -le = less than or equal
# -ge = greater than or equal

# File checks
if [ -f "/etc/passwd" ]; then       # -f = file exists
    echo "passwd exists"
fi

if [ -d "/home/alice" ]; then       # -d = directory exists
    echo "alice's home exists"
fi

if [ ! -f "file.txt" ]; then        # ! = NOT
    echo "file.txt does NOT exist"
fi
```

---

## Loops
```bash
#!/bin/bash

# For loop
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# For loop over files
for file in /var/log/*.log; do
    echo "Log file: $file"
done

# C-style for loop
for ((i=1; i<=10; i++)); do
    echo $i
done

# While loop
COUNT=0
while [ $COUNT -lt 5 ]; do
    echo "Count: $COUNT"
    COUNT=$((COUNT + 1))
done

# Loop over lines in a file
while IFS= read -r line; do
    echo "Line: $line"
done < /etc/passwd
```

---

## Functions
```bash
#!/bin/bash

# Define a function
greet() {
    local name=$1       # $1 = first argument to function
    echo "Hello, $name!"
}

check_disk() {
    local threshold=$1
    local usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    if [ $usage -gt $threshold ]; then
        echo "WARNING: Disk usage is ${usage}%"
        return 1
    else
        echo "OK: Disk usage is ${usage}%"
        return 0
    fi
}

# Call functions
greet "Alice"
greet "Bob"
check_disk 80
```

---

## Real-World Script — System Health Monitor
```bash
#!/bin/bash
# system_health.sh — Check system health and log issues

LOG="/var/log/health_check.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

check_cpu() {
    local cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    if (( $(echo "$cpu > 90" | bc -l) )); then
        echo "[$DATE] ALERT: CPU at ${cpu}%" >> $LOG
    fi
}

check_memory() {
    local mem=$(free | awk '/Mem/{printf "%.1f", $3/$2*100}')
    if (( $(echo "$mem > 85" | bc -l) )); then
        echo "[$DATE] ALERT: Memory at ${mem}%" >> $LOG
    fi
}

check_disk() {
    local disk=$(df / | awk 'NR==2{print $5}' | tr -d '%')
    if [ $disk -gt 90 ]; then
        echo "[$DATE] ALERT: Disk at ${disk}%" >> $LOG
    fi
}

# Run all checks
check_cpu
check_memory
check_disk
echo "[$DATE] Health check complete" >> $LOG

# Add to cron to run every 5 minutes:
# */5 * * * * /usr/local/bin/system_health.sh
```

---

## Useful Script Tips
```bash
# Always start with
set -e          # Exit on any error
set -u          # Exit on undefined variable
set -o pipefail # Catch pipe errors

# Print each command before running (debug mode)
set -x

# Check if running as root
if [ $EUID -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Default value if variable not set
NAME=${1:-"default_value"}

# String operations
STR="Hello Linux"
echo ${#STR}            # Length of string → 11
echo ${STR:6}           # Substring from index 6 → Linux
echo ${STR/Linux/World} # Replace → Hello World

# Arrays
FRUITS=("apple" "banana" "cherry")
echo ${FRUITS[0]}       # First element → apple
echo ${FRUITS[@]}       # All elements
echo ${#FRUITS[@]}      # Number of elements → 3
```

---

## Next Chapter

👉 [Chapter 10 — Modern Linux](10-modern-linux.md)