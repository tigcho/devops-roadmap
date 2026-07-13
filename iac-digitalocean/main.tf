terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "this" {
  name       = var.ssh_key_name
  public_key = file(var.ssh_public_key_path)
}

resource "digitalocean_droplet" "this" {
  image  = var.droplet_image
  name   = var.droplet_name
  region = var.droplet_region
  size   = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.this.fingerprint]

  tags = var.droplet_tags
}
