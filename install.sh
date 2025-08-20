#!/bin/bash
# Installer 1 klik Telegram Bot Dobot + systemd service

# 1. Update & install paket dasar
apt update && apt upgrade -y
apt install -y python3 python3-pip git

# 2. Clone atau update repo Dobot
cd /root
if [ -d "dobot" ]; then
    echo "Folder dobot sudah ada, melakukan update..."
    cd dobot
    git pull origin main
else
    git clone https://github.com/virasinah/dobot.git
    cd dobot
fi

# 3. Install requirements jika ada
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt
fi

# 4. Buat file systemd service
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

# 5. Reload systemd & jalankan service
systemctl daemon-reload
systemctl enable dobot
systemctl restart dobot

echo "✅ Bot Dobot berhasil diinstal dan dijalankan sebagai service!"
echo "Cek status dengan: systemctl status dobot"

