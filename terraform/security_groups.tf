resource "yandex_vpc_security_group" "devops3-appservers-sg" {
  name        = "devops3-app-servers-security-group"
  network_id  = yandex_vpc_network.devops3-network.id

  ingress {
    protocol       = "TCP"
    description    = "SSH access"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    description    = "Outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [yandex_vpc_subnet.devops3-subnet]
}