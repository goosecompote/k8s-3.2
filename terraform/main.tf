#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}
#создаем подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = "develop-ru-central1-a"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu-2004-lts" {
  family = var.vm_image
}

resource "yandex_compute_instance" "master" {
  count = 1
  name        = "master-${count.index + 1}"
  platform_id = var.platform
  resources {
    cores         = var.master_cores
    memory        = var.master_memory
    core_fraction = var.master_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.storage_disk_type
      size     = var.hdd_master_vol_size
    }
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/for_yandex.pub")}"
  }
  scheduling_policy { preemptible = true }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true

  }
  allow_stopping_for_update = true
}

resource "yandex_compute_instance" "worker" {
  count = 4
  name        = "worker-${count.index + 1}"
  platform_id = var.platform
  resources {
    cores         = var.worker_cores
    memory        = var.worker_memory
    core_fraction = var.worker_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.storage_disk_type
      size     = var.hdd_worker_vol_size
    }
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/for_yandex.pub")}"
  }
  scheduling_policy { preemptible = true }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
    #nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
  }
  allow_stopping_for_update = true
}