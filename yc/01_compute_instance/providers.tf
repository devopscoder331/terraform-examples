terraform {
  required_providers {
      yandex = {
          source = "yandex-cloud/yandex"
          version = "~> 0.72.0"
      }
  }
}

// create provider for yc
provider "yandex" {
  service_account_key_file = var.key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone_id
}