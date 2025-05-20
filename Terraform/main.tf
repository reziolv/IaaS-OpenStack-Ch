terraform {
  required_providers {
    arvan = {
      source = "terraform.arvancloud.ir/arvancloud/iaas"
    }
  }
}

provider "arvan" {
 api_key = "apikey 13c3ee9d-c483-5030-a2e9-682237f2c597"
}

data "arvan_security_groups" "default" {
  region = var.region
}

data "arvan_images" "ubuntu_image" {
  region     = var.region
  image_type = "distributions"
}


data "arvan_plans" "plans" {
  region = var.region
}

locals {
  chosen_image = try([
    for image in data.arvan_images.ubuntu_image.distributions : image
    if image.distro_name == var.chosen_distro_name && image.name == var.chosen_name
  ][0], null)

  selected_plan = try([
    for plan in data.arvan_plans.plans.plans : plan
    if plan.id == var.chosen_plan_id
  ][0], null)
}

resource "arvan_network" "private" {
  region      = var.region
  name        = "openstack-private-net"
  description = "Private network for OpenStack nodes"
  cidr        = "192.168.10.0/24"
  gateway_ip  = "192.168.10.1"
  enable_gateway = true
  enable_dhcp    = true
  dhcp_range = {
    start = "192.168.10.20"
    end   = "192.168.10.24"
  }
  dns_servers = ["8.8.8.8", "1.1.1.1"]
}

resource "arvan_volume" "nodes" {
  count       = length(var.node_names)
  region      = var.region
  name        = "volume-${var.node_names[count.index]}"
  description = "Volume for ${var.node_names[count.index]}"
  size        = 20
}

resource "arvan_abrak" "nodes" {
  depends_on     = [arvan_volume.nodes, arvan_network.private]
  count          = length(var.node_names)
  region         = var.region
  name           = var.node_names[count.index]
  ssh_key_name   = var.ssh_key_name
  image_id       = local.chosen_image.id
  flavor_id      = local.selected_plan.id
  disk_size      = 25
  networks = [
    {
      network_id = arvan_network.private.network_id
    }
  ]
  volumes = [arvan_volume.nodes[count.index].id]
  security_groups = [data.arvan_security_groups.default.groups[0].id]

  timeouts {
    create = "2m"
    update = "2m"
    delete = "1m"
    read   = "2m"
  }
}
