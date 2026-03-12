1. Create dummy script at `/usr/local/bin/dummy.sh`
2. Create dummy service at `/etc/systemd/system/dummy.service`
3. Manage the service with these commands:
```
sudo systemctl daemon-reload
sudo systemctl restart dummy
sudo systemctl status dummy
```

### Links
- [Example Service Creation](https://www.baeldung.com/linux/create-remove-systemd-services)
- [Project Link](https://roadmap.sh/projects/dummy-systemd-service)
