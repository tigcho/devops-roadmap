terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "nodejs_service" {
  image  = "ubuntu-22-04-x64"
  name   = "nodejs-service"
  region = var.do_region
  size   = var.do_size
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]

  tags = ["nodejs", "cicd"]
}

data "digitalocean_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}

output "droplet_ip" {
  description = "Public IP address of the droplet"
  value       = digitalocean_droplet.nodejs_service.ipv4_address
}

output "droplet_name" {
  description = "Name of the droplet"
  value       = digitalocean_droplet.nodejs_service.name
}
