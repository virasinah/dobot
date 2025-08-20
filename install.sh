#!/bin/bash
# Installer 1 klik Telegram Bot Dobot + systemd service

# Update & install paket dasar
apt update && apt upgrade -y
apt install -y python3 python3-pip git

# Tentukan folder instalasi
BOT_DIR="/root/dobot"

# Clone atau update repo Dobot
if [ -d "$BOT_DIR" ]; then
    echo "Folder dobot sudah ada, melakukan update..."
    cd "$BOT_DIR"
    git pull origin main
else
    git clone https://github.com/virasinah/dobot.git "$BOT_DIR"
fi

# Install requirements jika ada
if [ -f "$BOT_DIR/requirements.txt" ]; then
    pip3 install -r "$BOT_DIR/requirements.txt"
fi

# Buat file systemd service
cat > /etc/systemd/system/dobot.service << 'EOF'
[Unit]
Description=Telegram Bot Dobot
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/dobot
ExecStart=/usr/bin/python3 /root/dobot/main.py
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd & jalankan service
systemctl daemon-reload
systemctl enable dobot
systemctl restart dobot

echo "✅ Bot Dobot berhasil diinstal dan dijalankan sebagai service!"
echo "Cek status: systemctl status dobot"
