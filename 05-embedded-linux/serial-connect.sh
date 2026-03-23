#!/bin/bash
# ─────────────────────────────────────────
# serial-connect.sh — Connect to serial device
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash serial-connect.sh [device] [baud]
# Example: bash serial-connect.sh /dev/ttyUSB0 115200
# ─────────────────────────────────────────

DEVICE=${1:-"/dev/ttyUSB0"}
BAUD=${2:-"115200"}

echo "============================================"
echo "         SERIAL CONNECTION TOOL"
echo "============================================"
echo ""

# ── Check if device exists ───────────────
if [ ! -e "$DEVICE" ]; then
    echo "❌ Device $DEVICE not found!"
    echo ""
    echo "Available serial devices:"
    ls /dev/tty* 2>/dev/null | grep -E "USB|ACM|S[0-9]"
    exit 1
fi

echo "📡 Device:    $DEVICE"
echo "⚡ Baud rate: $BAUD"
echo ""

# ── Check which tools are available ──────
if command -v screen &>/dev/null; then
    echo "🔧 Connecting with screen..."
    echo "   To exit: Ctrl+A then K"
    echo ""
    screen "$DEVICE" "$BAUD"

elif command -v minicom &>/dev/null; then
    echo "🔧 Connecting with minicom..."
    echo "   To exit: Ctrl+A then X"
    echo ""
    minicom -D "$DEVICE" -b "$BAUD"

elif command -v picocom &>/dev/null; then
    echo "🔧 Connecting with picocom..."
    echo "   To exit: Ctrl+A then Ctrl+X"
    echo ""
    picocom -b "$BAUD" "$DEVICE"

else
    echo "❌ No serial tool found!"
    echo ""
    echo "Install one with:"
    echo "   sudo apt install screen"
    echo "   sudo apt install minicom"
    echo "   sudo apt install picocom"
    exit 1
fi
