#!/bin/bash
# ─────────────────────────────────────────
# user-setup.sh — Set up a new Linux user
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash user-setup.sh [username]
# Example: bash user-setup.sh alice
# ─────────────────────────────────────────

# ── Check if running as root ─────────────
if [ $EUID -ne 0 ]; then
    echo "❌ Please run as root: sudo bash user-setup.sh"
    exit 1
fi

# ── Get username ─────────────────────────
USERNAME=${1:-""}

if [ -z "$USERNAME" ]; then
    read -p "Enter new username: " USERNAME
fi

if [ -z "$USERNAME" ]; then
    echo "❌ ERROR: Username cannot be empty!"
    exit 1
fi

echo "============================================"
echo "          USER SETUP TOOL"
echo "============================================"
echo ""
echo "👤 Setting up user: $USERNAME"
echo ""

# ── Check if user already exists ─────────
if id "$USERNAME" &>/dev/null; then
    echo "❌ ERROR: User '$USERNAME' already exists!"
    exit 1
fi

# ── Create user ──────────────────────────
echo "⏳ Creating user account..."
useradd -m -s /bin/bash "$USERNAME"

if [ $? -ne 0 ]; then
    echo "❌ ERROR: Failed to create user!"
    exit 1
fi
echo "✅ User account created!"
echo ""

# ── Set password ─────────────────────────
echo "🔑 Setting password for $USERNAME..."
passwd "$USERNAME"
echo ""

# ── Create standard folders ──────────────
echo "📁 Creating standard folders..."
mkdir -p /home/$USERNAME/{Documents,Downloads,Projects,Scripts}
chown -R $USERNAME:$USERNAME /home/$USERNAME/
echo "✅ Folders created!"
echo ""

# ── Ask about sudo access ─────────────────
read -p "🔐 Give $USERNAME sudo access? (yes/no): " SUDO_ANSWER

if [ "$SUDO_ANSWER" == "yes" ]; then
    usermod -aG sudo "$USERNAME"
    echo "✅ Sudo access granted!"
else
    echo "ℹ️  No sudo access given."
fi
echo ""

# ── Copy bashrc template ─────────────────
if [ -f "/etc/skel/.bashrc" ]; then
    cp /etc/skel/.bashrc /home/$USERNAME/.bashrc
    chown $USERNAME:$USERNAME /home/$USERNAME/.bashrc
    echo "✅ Default .bashrc copied!"
fi
echo ""

# ── Summary ──────────────────────────────
echo "============================================"
echo "   ✅ User setup complete!"
echo ""
echo "   Username:  $USERNAME"
echo "   Home:      /home/$USERNAME"
echo "   Shell:     /bin/bash"
echo "   Sudo:      $SUDO_ANSWER"
echo ""
echo "   Switch to user: su - $USERNAME"
echo "============================================"
