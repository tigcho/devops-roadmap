Edit `inventory.ini` with your server details:
```ini
[webservers]
your-server ansible_host=IP_ADDRESS ansible_user=USER
```

## Usage

Run all roles:
```bash
ansible-playbook -i inventory.ini setup.yml
```

Run specific roles:
```bash
ansible-playbook -i inventory.ini setup.yml --tags "app"
ansible-playbook -i inventory.ini setup.yml --tags "nginx"
ansible-playbook -i inventory.ini setup.yml --tags "base,ssh"
```

## Variables

### SSH Key
```bash
ansible-playbook -i inventory.ini setup.yml --extra-vars "ssh_public_key='ssh-rsa ...'"
```

### Tarball Deployment
```bash
ansible-playbook -i inventory.ini setup.yml --extra-vars "app_tarball_path=/path/to/site.tar.gz"
```

### GitHub Deployment
```bash
ansible-playbook -i inventory.ini setup.yml --extra-vars "app_github_repo=https://github.com/user/repo.git app_github_branch=main"
```

### Links
- [Project URL](https://roadmap.sh/projects/configuration-management)
