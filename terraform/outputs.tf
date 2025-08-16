output "app_server_1_ip" {
  value = yandex_compute_instance.app-server-1.network_interface.0.nat_ip_address
}

output "app_server_2_ip" {
  value = yandex_compute_instance.app-server-2.network_interface.0.nat_ip_address
}