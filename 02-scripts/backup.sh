#!/bin/bash
# ─────────────────────────────────────────
# backup.sh — Simple backup tool
# Part of: linux-for-beginners by Ketul Patel
# Usage: bash backup.sh [source] [destination]
# Example: bash backup.sh /home/user/documents /backup
# ─────────────────────────────────────────

DATE=$(date '+%Y-%m-%d_%H-%M-%S')
SOURCE=${1:-"$HOME"}
DEST=${2:-"/tmp/backups"}
BACKUP_NAME="backup_${DATE}.tar.gz"
BACKUP_PATH="$DEST/$BACKUP_NAME"

echo "============================================"
echo "           BACKUP TOOL"
echo "============================================"
echo ""
echo "📁 Source:      $SOURCE"
echo "📦 Destination: $DEST"
echo "📄 Backup file: $BACKUP_NAME"
echo ""

# ── Check source exists ───────────────────
if [ ! -d "$SOURCE" ] && [ ! -f "$SOURCE" ]; then
    echo "❌ ERROR: Source '$SOURCE' does not exist!"
    exit 1
fi

# ── Create destination if needed ─────────
if [ ! -d "$DEST" ]; then
    echo "📂 Creating destination folder: $DEST"
    mkdir -p "$DEST"
fi

# ── Run backup ───────────────────────────
echo "⏳ Starting backup..."
tar -czf "$BACKUP_PATH" "$SOURCE" 2>/dev/null

# ── Check if backup succeeded ────────────
if [ $? -eq 0 ]; then
    SIZE=$(du -sh "$BACKUP_PATH" | cut -f1)
    echo "✅ Backup complete!"
    echo ""
    echo "============================================"
    echo "   File: $BACKUP_PATH"
    echo "   Size: $SIZE"
    echo "   Time: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "============================================"
else
    echo "❌ ERROR: Backup failed!"
    exit 1
fi

# ── Remove backups older than 7 days ─────
echo ""
echo "🧹 Cleaning up backups older than 7 days..."
find "$DEST" -name "backup_*.tar.gz" -mtime +7 -delete
echo "✅ Cleanup done!"
