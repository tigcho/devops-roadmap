#!/bin/bash

LOCAL_DIR="/path/to/static-site-server"
REMOTE_DIR="/var/www/html"

SERVER_USER="admin"
SERVER_IP="<your-server-ip>"

SSH_KEY="/path/to/example.pem"

echo "Starting deployment process on the remote server..."
ssh -i $SSH_KEY $SERVER_USER@$SERVER_IP <<EOF
    echo "Installing necessary packages..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install nginx rsync -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "Packages have been installed."

    echo "Creating remote directory..."
    sudo mkdir -p /var/www/html
    echo "Directory has been created."

    echo "Changing ownership of the directory to $SERVER_USER..."
    sudo chown -R $SERVER_USER:$SERVER_USER $REMOTE_DIR
    echo "Setting directory permissions to 755..."
    sudo chmod -R 755 $REMOTE_DIR
    echo "Ownership and permissions have been updated."
EOF

echo "Syncing files to the remote server..."
rsync -avz -e "ssh -i $SSH_KEY" --delete --rsync-path="sudo rsync" $LOCAL_DIR/ $SERVER_USER@$SERVER_IP:$REMOTE_DIR


echo "Deployment complete!"
