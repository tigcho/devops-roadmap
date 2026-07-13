output "droplet_id" {
  description = "ID of the Droplet"
  value       = digitalocean_droplet.this.id
}

output "droplet_ip" {
  description = "Public IP address of the Droplet"
  value       = digitalocean_droplet.this.ipv4_address
}

output "droplet_name" {
  description = "Name of the Droplet"
  value       = digitalocean_droplet.this.name
}
