Configure variables:

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

Create Droplet:

```bash
terraform init
terraform apply
```

After Droplet created, update inventory with IP:

```bash
export DROPLET_IP=$(terraform output -raw droplet_ip)
envsubst < ansible-inventory.yml > inventory.ini
ansible-playbook -i inventory.ini configure-server.yml \
  --extra-vars "ssh_public_key=$(cat ~/.ssh/id_rsa.pub)" \
  --roles-path ../configuration-management/roles
```

SSH Access: 

```bash
ssh root@$(terraform output -raw droplet_ip)
```

### Links
- [Project URL](https://roadmap.sh/projects/iac-digitalocean)
- [DigitalOcean Docs](https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean)
