output "nat_ip_addresses" {
  description = "NAT IP addresses of all VMs"
  value = {
    master-1  = yandex_compute_instance.master[0].network_interface[0].nat_ip_address
    worker-1  = yandex_compute_instance.worker[0].network_interface[0].nat_ip_address
    worker-2 = yandex_compute_instance.worker[1].network_interface[0].nat_ip_address
    worker-3 = yandex_compute_instance.worker[2].network_interface[0].nat_ip_address
    worker-4 = yandex_compute_instance.worker[3].network_interface[0].nat_ip_address
  }
} 
