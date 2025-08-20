#!/bin/bash
clear
echo "=== Instalasi Dobot 24 Jam ==="

# Update & install dependencies
apt update -y
apt upgrade -y
apt install -y python3 python3-pip curl git

# Buat direktori Dobot
mkdir -p /root/dobot
cd /root/dobot

# Unduh main.py (sesuaikan dengan repo Anda)
curl -sSL https://raw.githubusercontent.com/virasinah/dobot/main/main.py -o main.py

# Optional: install Python packages jika ada requirements.txt
if curl --output /dev/null --silent --head --fail https://raw.githubusercontent.com/virasinah/dobot/main/requirements.txt; then
    curl -sSL https://raw.githubusercontent.com/virasinah/dobot/main/requirements.txt -o requirements.txt
    pip3 install -r requirements.txt
fi

# Buat systemd service
cat <<EOF >/etc/systemd/system/dobot.service
[Unit]
Description=Dobot Bot Service
After=network.target

[Service]
User=root
WorkingDirectory=/root/dobot
ExecStart=/usr/bin/python3 /root/dobot/main.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd & aktifkan service
systemctl daemon-reload
systemctl enable dobot.service
systemctl start dobot.service

echo "=== Instalasi selesai! Dobot berjalan 24 jam ==="
echo "Cek status: systemctl status dobot.service"
