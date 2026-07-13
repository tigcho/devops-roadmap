variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "droplet_name" {
  description = "Name of the Droplet"
  type        = string
  default     = "terraform-droplet"
}

variable "droplet_region" {
  description = "Region for the Droplet"
  type        = string
  default     = "nyc1"
}

variable "droplet_size" {
  description = "Size slug for the Droplet"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "droplet_image" {
  description = "OS image slug"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "droplet_tags" {
  description = "Tags for the Droplet"
  type        = list(string)
  default     = ["terraform"]
}

variable "ssh_key_name" {
  description = "Name for SSH key in DigitalOcean"
  type        = string
  default     = "terraform-key"
}

variable "ssh_public_key_path" {
  description = "Path to public SSH key"
  type        = string
}
