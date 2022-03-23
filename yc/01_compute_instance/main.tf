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
    ssh-keys = "ubuntu:${file(var.ssh_keys)}"
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