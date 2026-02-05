1. I didn't sign up on a cloud provider and created a local ssh user instead.
```
sudo adduser sshuser
sudo usermod -aG sudo sshuser
```

2. Generate two keys
```
ssh-keygen -f ~/.ssh/key1
ssh-keygen -f ~/.ssh/key2
```

3. Add the public keys to the server user and fix the permissions
```
sudo -u sshuser mkdir -p /home/sshuser/.ssh
sudo -u sshuser nvim /home/sshuser/.ssh/authorized_keys

sudo chown -R sshuser:sshuser /home/sshuser/.ssh
sudo chmod 700 /home/sshuser/.ssh
sudo chmod 600 /home/sshuser/.ssh/authorized_keys
```

4. Find your public IP and connect to it
```
curl ifconfig.me
ssh -i ~/.ssh/key1 sshuser@<IP_ADDRESS>
```

5. Or connect to it with an alias by editing the .ssh/config file
```
Host myserver
    HostName PUBLIC_IP
    User sshuser
    IdentityFile ~/.ssh/key1

ssh myserver
```

6. For the stretch goal, edit the local jail config
```
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nvim /etc/fail2ban/jail.local

[sshd]
enabled = true
port = ssh
filter = sshd
logpath = %(sshd_log)s
maxretry = 5
bantime = 1h
findtime = 10m

sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
```

### Links
- [Project URL](https://roadmap.sh/projects/ssh-remote-server-setup)
