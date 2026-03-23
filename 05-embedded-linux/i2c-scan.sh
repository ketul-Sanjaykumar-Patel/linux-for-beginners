#!/bin/bash
# ─────────────────────────────────────────
# i2c-scan.sh — Scan I2C bus for devices
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash i2c-scan.sh [bus_number]
# Example: bash i2c-scan.sh 1
# ─────────────────────────────────────────

BUS=${1:-"1"}

echo "============================================"
echo "           I2C BUS SCANNER"
echo "============================================"
echo ""

# ── Check if i2c-tools installed ─────────
if ! command -v i2cdetect &>/dev/null; then
    echo "❌ i2c-tools not installed!"
    echo "   Run: sudo apt install i2c-tools"
    exit 1
fi

# ── Check if bus exists ──────────────────
if [ ! -e "/dev/i2c-$BUS" ]; then
    echo "❌ I2C bus $BUS not found!"
    echo ""
    echo "Available I2C buses:"
    ls /dev/i2c-* 2>/dev/null || echo "   None found"
    echo ""
    echo "Enable I2C on Raspberry Pi:"
    echo "   sudo raspi-config → Interface Options → I2C"
    exit 1
fi

echo "🔍 Scanning I2C bus $BUS..."
echo ""
sudo i2cdetect -y "$BUS"
echo ""

# ── Common I2C device addresses ──────────
echo "============================================"
echo "Common I2C Device Addresses:"
echo ""
echo "   0x20-0x27  → PCF8574 GPIO expander"
echo "   0x27       → LCD display (common)"
echo "   0x3C/0x3D  → SSD1306 OLED display"
echo "   0x48-0x4F  → ADS1115 ADC / LM75 temp"
echo "   0x68       → MPU-6050 gyro / DS3231 RTC"
echo "   0x76/0x77  → BMP280/BME280 pressure"
echo "============================================"
