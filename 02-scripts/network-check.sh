#!/bin/bash
# ─────────────────────────────────────────
# network-check.sh — Test network status
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash network-check.sh
# ─────────────────────────────────────────

DATE=$(date '+%Y-%m-%d %H:%M:%S')
ISSUES=0

echo "============================================"
echo "          NETWORK STATUS CHECK"
echo "   $DATE"
echo "============================================"
echo ""

# ── Network Interfaces ───────────────────
echo "🔌 Network Interfaces:"
ip addr | grep -E "^[0-9]+:|inet " | awk '
    /^[0-9]+:/ { iface=$2 }
    /inet /    { print "   " iface " → " $2 }
'
echo ""

# ── Default Gateway ──────────────────────
echo "🚪 Default Gateway:"
GATEWAY=$(ip route | grep default | awk '{print $3}')
if [ -n "$GATEWAY" ]; then
    echo "   $GATEWAY"
else
    echo "   ❌ No gateway found!"
    ISSUES=$((ISSUES + 1))
fi
echo ""

# ── DNS Servers ──────────────────────────
echo "🔍 DNS Servers:"
cat /etc/resolv.conf | grep nameserver | awk '{print "   " $2}'
echo ""

# ── Ping Tests ───────────────────────────
echo "📡 Connectivity Tests:"

ping_test() {
    local host=$1
    local label=$2
    echo -n "   $label ($host)... "
    if ping -c 1 -W 2 "$host" &>/dev/null; then
        local ms=$(ping -c 1 "$host" | grep time= | awk -F'time=' '{print $2}' | cut -d' ' -f1)
        echo "✅ OK (${ms}ms)"
    else
        echo "❌ FAILED"
        ISSUES=$((ISSUES + 1))
    fi
}

ping_test "192.168.1.1"  "Local Gateway"
ping_test "8.8.8.8"      "Google DNS"
ping_test "1.1.1.1"      "Cloudflare DNS"
ping_test "google.com"   "google.com"
ping_test "github.com"   "github.com"
echo ""

# ── DNS Resolution Test ──────────────────
echo "🌐 DNS Resolution Test:"
echo -n "   Resolving google.com... "
if nslookup google.com &>/dev/null; then
    IP=$(nslookup google.com | grep "Address:" | tail -1 | awk '{print $2}')
    echo "✅ OK → $IP"
else
    echo "❌ FAILED — DNS not working!"
    ISSUES=$((ISSUES + 1))
fi
echo ""

# ── Open Ports ───────────────────────────
echo "🔓 Listening Ports:"
ss -tulpn | grep LISTEN | awk '{print "   " $1 " → " $5}' | head -10
echo ""

# ── Internet Speed (basic) ───────────────
echo "⚡ Download Speed Test:"
echo -n "   Downloading test file... "
SPEED=$(curl -o /dev/null -s -w "%{speed_download}" \
    https://speed.cloudflare.com/__down?bytes=1000000 2>/dev/null)
if [ -n "$SPEED" ]; then
    MBPS=$(echo "scale=2; $SPEED/125000" | bc)
    echo "✅ ~${MBPS} Mbps"
else
    echo "⚠️  Could not measure speed"
fi
echo ""

# ── Summary ──────────────────────────────
echo "============================================"
if [ $ISSUES -eq 0 ]; then
    echo "   ✅ All network checks passed!"
else
    echo "   ❌ $ISSUES issue(s) found — check above!"
fi
echo "============================================"
