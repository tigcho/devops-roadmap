```
nodejs-service/
├── server.js              # Simple Node.js application
├── package.json           # Node.js dependencies
├── terraform/            # Infrastructure as Code
├── ansible/              # Configuration management
├── .github/workflows/    # CI/CD pipelines
└── README.md
```

## Setup

```bash
cd terraform

# Copy example file and add your values
cp terraform.tfvars.example terraform.tfvars

# Initialize and apply
terraform init
terraform apply
```

```bash
# Update inventory with your droplet IP
cd ansible
sed -i 's/YOUR_DROPLET_IP/your_actual_ip/g' inventory.ini

# Test connection
ansible webservers -m ping

# Run server setup
ansible-playbook server_setup.yml
```

```bash
# Update app repository URL in ansible/roles/app/defaults/main.yml
# Then deploy
ansible-playbook node_service.yml --tags app
```

Access your app at `http://YOUR_DROPLET_IP`

### Automated Deployment

**Required GitHub Secrets:**
- `SSH_PRIVATE_KEY` - Your private SSH key
- `DROPLET_IP` - Your DigitalOcean droplet IP

**Setup steps:**
1. Push code to GitHub
2. Add secrets in GitHub repo settings
3. Choose deployment method:

**Option A: Ansible**
- Uses `deploy-ansible.yml` workflow
- Runs Ansible playbook in GitHub Actions

**Option B: SSH** 
- Uses `deploy-ssh.yml` workflow
- Direct SSH commands with rsync
