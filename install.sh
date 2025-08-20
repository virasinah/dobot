#!/bin/bash
# Installer untuk Telegram Bot Dobot

# Update paket
apt update && apt upgrade -y
apt install -y python3 python3-pip git

# Masuk ke folder bot (pastikan repo sudah di-clone ke /root/dobot)
cd /root/dobot || exit

# Install requirements kalau ada
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt
fi

# Copy service file ke systemd
cp dobot.service /etc/systemd/system/dobot.service

# Reload systemd & aktifkan service
systemctl daemon-reload
systemctl enable dobot
systemctl restart dobot

echo "✅ Bot Dobot berhasil diinstal dan dijalankan sebagai service!"
echo "Cek status: systemctl status dobot"
