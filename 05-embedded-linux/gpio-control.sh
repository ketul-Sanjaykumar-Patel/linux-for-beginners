#!/bin/bash
# ─────────────────────────────────────────
# gpio-control.sh — Control GPIO on Linux boards
# Part of: linux-for-beginners by Ketul Patel
# Works on: Raspberry Pi, BeagleBone, Orange Pi
# Usage: bash gpio-control.sh [pin] [on/off]
# Example: bash gpio-control.sh 17 on
# ─────────────────────────────────────────

PIN=$1
STATE=$2
GPIO_PATH="/sys/class/gpio"

# ── Check arguments ──────────────────────
if [ -z "$PIN" ] || [ -z "$STATE" ]; then
    echo "Usage: bash gpio-control.sh [pin_number] [on/off]"
    echo "Example: bash gpio-control.sh 17 on"
    exit 1
fi

echo "============================================"
echo "           GPIO CONTROL TOOL"
echo "============================================"
echo ""

# ── Check if running on Linux with GPIO ──
if [ ! -d "$GPIO_PATH" ]; then
    echo "❌ ERROR: GPIO not available on this system!"
    echo "   This script requires a Linux board with GPIO"
    echo "   e.g. Raspberry Pi, BeagleBone, Orange Pi"
    exit 1
fi

# ── Export pin if not already exported ───
if [ ! -d "$GPIO_PATH/gpio$PIN" ]; then
    echo "📌 Exporting GPIO pin $PIN..."
    echo $PIN > $GPIO_PATH/export
    sleep 0.1
    echo "✅ Done!"
fi

# ── Set pin as output ────────────────────
echo "⚙️  Setting GPIO $PIN as OUTPUT..."
echo "out" > $GPIO_PATH/gpio$PIN/direction
echo "✅ Done!"
echo ""

# ── Set value ────────────────────────────
if [ "$STATE" == "on" ]; then
    echo 1 > $GPIO_PATH/gpio$PIN/value
    echo "💡 GPIO $PIN → ON  (HIGH)"

elif [ "$STATE" == "off" ]; then
    echo 0 > $GPIO_PATH/gpio$PIN/value
    echo "💡 GPIO $PIN → OFF (LOW)"

else
    echo "❌ ERROR: State must be 'on' or 'off'"
    echo "   Example: bash gpio-control.sh 17 on"
    exit 1
fi

echo ""

# ── Verify current value ─────────────────
CURRENT=$(cat $GPIO_PATH/gpio$PIN/value)
echo "🔍 Verified pin value: $CURRENT"
echo ""
echo "============================================"
echo "   Pin:   $PIN"
echo "   State: $STATE"
echo "   Value: $CURRENT"
echo "============================================"
