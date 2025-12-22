#!/bin/bash

set -e

APP_NAME="cyberecon"
INSTALL_DIR="/usr/local/share/$APP_NAME"
BIN_DIR="/usr/local/bin"
LAUNCHER="$BIN_DIR/$APP_NAME"

echo "[*] Installing CYBERECON..."

if ! command -v sudo >/dev/null 2>&1; then
    echo "[!] sudo is required to install CYBERECON."
    exit 1
fi

# -----------------------------
# 1. Check for gum
# -----------------------------
if ! command -v gum >/dev/null 2>&1; then
    echo "[!] gum is not installed."
    echo "    Install it using:"
    echo "    sudo apt install gum"
    exit 1
fi

# -----------------------------
# 2. Create install directory
# -----------------------------
echo "[*] Creating install directory: $INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"

# -----------------------------
# 3. Copy files
# -----------------------------
echo "[*] Copying CYBERECON files..."
sudo cp -r scripts tools "$INSTALL_DIR"

# -----------------------------
# 4. Fix permissions
# -----------------------------
echo "[*] Setting executable permissions..."
sudo chmod +x "$INSTALL_DIR/scripts/bash/cyberecon.sh"

# -----------------------------
# 5. Create launcher
# -----------------------------
echo "[*] Creating launcher: $LAUNCHER"
sudo tee "$LAUNCHER" >/dev/null <<EOF
#!/bin/bash
exec "$INSTALL_DIR/scripts/bash/cyberecon.sh" "\$@"
EOF

sudo chmod +x "$LAUNCHER"

# -----------------------------
# 6. Done
# -----------------------------
echo
echo "[✔] CYBERECON installed successfully!"
echo
echo "Run it using:"
echo "  cyberecon"
