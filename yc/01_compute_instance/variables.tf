#------------------------------------------------
# Variables for connect to Providers
#------------------------------------------------

variable "key_file" {
    description = "Contains either a path to or the contents of the Service Account file in JSON format"
    type = string
}

variable "cloud_id" {
    description = "The ID of the cloud to apply any resources to"
    type = string
}

variable "folder_id" {
    description = "The ID of the folder to operate under, if not specified by a given resource"
    type = string
}

variable "zone_id" {
    description = "The default availability zone to operate under, if not specified by a given resource"
    type = string
}

#------------------------------------------------
# Variables for connect to Providers
#------------------------------------------------

variable "vps_count" {
    description = "vps_count"
    type = string
}

variable "platform_id" {
    description = "The type of virtual machine to create. The default is 'standard-v1'"
    type = string
}

variable "zone" {
    description = "The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used."
    type = string
}

variable "image_id" {
    description = "A disk image to initialize this disk from"
    type = string
}

variable "instance_fraction" {
    description = "If provided, specifies baseline performance for a core as a percent."
    type = string
}

variable "instance_cores" {
    description = "CPU cores for the instance"
    type = string
}

variable "instance_memory" {
    description = "Memory size in GB"
    type = string
}

variable "instance_preemptible" {
    description = "Specifies if the instance is preemptible. Defaults to false."
    type = string
}

variable "disk_size" {
    description = "Size of the disk in GB."
    type = string
}

variable "ssh_private_key" {
    description = "ssh_private_key for ansible installations"
    type = string
}

variable "ssh_public_key" {
    description = "ssh_public_key for ansible installations"
    type = string
}

variable "ssh_user" {
    description = "ssh_user who use for for ansible installations"
    type = string
}

variable "task_name" {
    description = "task_name"
    type = string
}

variable "user_email" {
    description = "user_email"
    type = string
}

variable "lab-subnet-a" {
    description = "ID of the subnet to attach this interface to. The subnet must exist in the same zone where this instance will be created"
    type = string
}