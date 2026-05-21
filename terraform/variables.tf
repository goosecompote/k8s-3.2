###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM OS image"
}

variable "hdd_master_vol_size" {
  type = number
  default = 50
  description = "HDD volume size"
}

variable "hdd_worker_vol_size" {
  type = number
  default = 100
  description = "HDD volume size"
}

variable "platform" {
  type        = string
  default     = "standard-v3"
  description = "WM Platform"
}

variable "storage_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "storage_disk_type"
}

variable "username" {
  type    = string
  default = "ubuntu"
}

variable "ssh_public_key" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

#master
variable "master_cores" {
  type = number
  default = 2
  description = "Processor cores"
}

variable "master_memory" {
  type = number
  default = 4
  description = "Memory"
}

variable "master_core_fraction" {
  type = number
  default = 20
  description = "Processor fraction"
}
#worker
variable "worker_cores" {
  type = number
  default = 4
  description = "Processor cores"
}

variable "worker_memory" {
  type = number
  default = 8
  description = "Memory"
}

variable "worker_core_fraction" {
  type = number
  default = 20
  description = "Processor fraction"
}

