#!/bin/bash
# ─────────────────────────────────────────
# install-essentials.sh — Install common tools
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash install-essentials.sh
# Note: Run as root or with sudo
# ─────────────────────────────────────────

# ── Check if running as root ─────────────
if [ $EUID -ne 0 ]; then
    echo "❌ Please run as root: sudo bash install-essentials.sh"
    exit 1
fi

echo "============================================"
echo "       INSTALL ESSENTIAL TOOLS"
echo "============================================"
echo ""

# ── Update system first ──────────────────
echo "📦 Updating package list..."
apt update -y
echo "✅ Done!"
echo ""

# ── Define tools to install ──────────────
TOOLS=(
    # System monitoring
    htop        # Better process monitor
    iotop       # Disk I/O monitor
    nethogs     # Network usage by process
    iftop       # Network usage by connection

    # File tools
    tree        # Show directory as tree
    ncdu        # Visual disk usage
    ranger      # Terminal file manager
    unzip       # Extract zip files
    zip         # Create zip files

    # Network tools
    curl        # Transfer data from URLs
    wget        # Download files
    nmap        # Network scanner
    net-tools   # ifconfig, netstat
    traceroute  # Trace network path
    dnsutils    # dig, nslookup

    # Text tools
    vim         # Text editor
    nano        # Beginner text editor
    jq          # JSON processor
    ripgrep     # Fast grep alternative

    # Development
    git         # Version control
    build-essential  # gcc, make, etc
    python3     # Python 3
    python3-pip # Python package manager

    # Security
    ufw         # Firewall
    fail2ban    # Brute force protection

    # Utilities
    tmux        # Terminal multiplexer
    screen      # Persistent sessions
    cron        # Task scheduler
    rsync       # File sync tool
)

# ── Install each tool ────────────────────
echo "🔧 Installing essential tools..."
echo ""

INSTALLED=0
FAILED=0

for tool in "${TOOLS[@]}"; do
    # Skip comment lines
    [[ "$tool" == \#* ]] && echo "" && echo "── $tool ──" && continue

    echo -n "   Installing $tool... "
    if apt install -y "$tool" &>/dev/null; then
        echo "✅"
        INSTALLED=$((INSTALLED + 1))
    else
        echo "❌ failed"
        FAILED=$((FAILED + 1))
    fi
done

# ── Summary ──────────────────────────────
echo ""
echo "============================================"
echo "   ✅ Installed: $INSTALLED tools"
echo "   ❌ Failed:    $FAILED tools"
echo "============================================"
echo ""
echo "🎉 Essential tools installation complete!"
echo "   Run 'htop' to test your new tools."
echo "============================================"
