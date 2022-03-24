// Create a new instance
resource "yandex_compute_instance" "vps" {
  count           = var.vps_count
  name            = "vps-${count.index + 1}"
  platform_id     = var.platform_id
  zone            = var.zone

  resources {
    core_fraction   = var.instance_fraction
    cores           = var.instance_cores
    memory          = var.instance_memory
    
  }

  scheduling_policy {
    preemptible     = var.instance_preemptible
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.lab-subnet-a.id
    nat       = true
  }

  metadata = {
    ansible_ssh = var.ssh_private_key
    ssh-keys = "ubuntu:${file(var.ssh_public_key)}"
  }

  labels = {
    task_name = var.task_name
    user_email = var.user_email
  }
}

// data resource yandex_vpc_subnet
data "yandex_vpc_subnet" "lab-subnet-a" {
  name = var.lab-subnet-a
}

// generate inventory file for Ansible
resource "local_file" "ansible_inventory" {
  ## hosts file for ansible
  filename = "${path.module}/hosts/hosts.ini"

  # template for generate host file
  content = templatefile("${path.module}/templates/ansible_hosts.tmpl",
  {
      vps = yandex_compute_instance.vps
      vps_name = yandex_compute_instance.vps.*.name,
      vps_nat_ip = yandex_compute_instance.vps[*].network_interface.0.nat_ip_address
      ansible_user = var.ssh_user
      ansible_ssh = yandex_compute_instance.vps[*].metadata.ansible_ssh
  }
  )
}

// Print Output
output "nat_ip_address" {
  value = yandex_compute_instance.vps[*].network_interface.0.nat_ip_address
  
}