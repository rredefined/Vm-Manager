#!/bin/bash
# ==========================
# 24/7 IDX Auto-Run Setup
# ==========================

read -p "Enter the full command to start your server/process (e.g., ./start-server.sh): " START_CMD

RUN_SCRIPT="/root/idx-24-7.sh"
cat > $RUN_SCRIPT <<EOF
#!/bin/bash
while true; do
    echo "Starting your server/process..."
    $START_CMD
    echo "Server/process stopped! Restarting in 5 seconds..."
    sleep 5
done
EOF

chmod +x $RUN_SCRIPT

SERVICE_FILE="/etc/systemd/system/idx-24-7.service"
cat > $SERVICE_FILE <<EOF
[Unit]
Description=IDX 24/7 Auto-Run Service
After=network.target

[Service]
Type=simple
User=root
ExecStart=$RUN_SCRIPT
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable idx-24-7.service
systemctl start idx-24-7.service

echo "✅ 24/7 IDX service setup complete!"
echo "Check status with: systemctl status idx-24-7.service -f"
