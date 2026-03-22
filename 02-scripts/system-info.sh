#!/bin/bash
# ─────────────────────────────────────────
# system-info.sh — Show system information
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash system-info.sh
# ─────────────────────────────────────────

echo "============================================"
echo "        SYSTEM INFORMATION REPORT"
echo "============================================"
echo ""

echo "🖥  SYSTEM"
echo "   OS:       $(lsb_release -d | cut -f2)"
echo "   Kernel:   $(uname -r)"
echo "   Hostname: $(hostname)"
echo "   Uptime:   $(uptime -p)"
echo ""

echo "⚙️  CPU"
echo "   Model: $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)"
echo "   Cores: $(nproc)"
echo "   Usage: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2}')%"
echo ""

echo "🧠 MEMORY"
free -h | awk 'NR==2{printf "   Total: %s | Used: %s | Free: %s\n", $2, $3, $4}'
echo ""

echo "💾 DISK"
df -h / | awk 'NR==2{printf "   Total: %s | Used: %s | Free: %s (%s used)\n", $2, $3, $4, $5}'
echo ""

echo "🌐 NETWORK"
echo "   IP:      $(hostname -I | awk '{print $1}')"
echo "   Gateway: $(ip route | grep default | awk '{print $3}')"
echo ""

echo "============================================"
echo "   Report generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================"
