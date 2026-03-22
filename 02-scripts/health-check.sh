#!/bin/bash
# ─────────────────────────────────────────
# health-check.sh — Monitor system health
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash health-check.sh
# ─────────────────────────────────────────

LOG="/var/log/health_check.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
ISSUES=0

echo "============================================"
echo "        SYSTEM HEALTH CHECK"
echo "   $DATE"
echo "============================================"
echo ""

# ── CPU Check ────────────────────────────
check_cpu() {
    local cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    echo "⚙️  CPU Usage: ${cpu}%"
    if (( $(echo "$cpu > 90" | bc -l) )); then
        echo "   ❌ WARNING: CPU usage is very high!"
        ISSUES=$((ISSUES + 1))
    else
        echo "   ✅ OK"
    fi
    echo ""
}

# ── Memory Check ─────────────────────────
check_memory() {
    local mem=$(free | awk '/Mem/{printf "%.1f", $3/$2*100}')
    local used=$(free -h | awk '/Mem/{print $3}')
    local total=$(free -h | awk '/Mem/{print $2}')
    echo "🧠 Memory Usage: ${mem}% (${used} of ${total})"
    if (( $(echo "$mem > 85" | bc -l) )); then
        echo "   ❌ WARNING: Memory usage is very high!"
        ISSUES=$((ISSUES + 1))
    else
        echo "   ✅ OK"
    fi
    echo ""
}

# ── Disk Check ───────────────────────────
check_disk() {
    local disk=$(df / | awk 'NR==2{print $5}' | tr -d '%')
    local free=$(df -h / | awk 'NR==2{print $4}')
    echo "💾 Disk Usage: ${disk}% (${free} free)"
    if [ $disk -gt 90 ]; then
        echo "   ❌ WARNING: Disk is almost full!"
        ISSUES=$((ISSUES + 1))
    else
        echo "   ✅ OK"
    fi
    echo ""
}

# ── Network Check ────────────────────────
check_network() {
    echo "🌐 Network:"
    if ping -c 1 8.8.8.8 &>/dev/null; then
        echo "   ✅ Internet connection: OK"
    else
        echo "   ❌ WARNING: No internet connection!"
        ISSUES=$((ISSUES + 1))
    fi
    echo ""
}

# ── Uptime Check ─────────────────────────
check_uptime() {
    echo "🕐 Uptime: $(uptime -p)"
    echo ""
}

# ── Run all checks ───────────────────────
check_cpu
check_memory
check_disk
check_network
check_uptime

# ── Summary ──────────────────────────────
echo "============================================"
if [ $ISSUES -eq 0 ]; then
    echo "   ✅ All checks passed — system is healthy!"
else
    echo "   ❌ $ISSUES issue(s) found — please investigate!"
fi
echo "============================================"
