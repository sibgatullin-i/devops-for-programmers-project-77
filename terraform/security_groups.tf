resource "yandex_vpc_security_group" "devops3-sg-appservers" {
  name        = "devops3-sg-appservers"
  description = "Security group for App Servers"
  network_id  = yandex_vpc_network.devops3-network.id

  ingress {
    description    = "SSH access"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [yandex_vpc_network.devops3-network]
}

resource "yandex_vpc_security_group" "devops3-sg-sql" {
  name        = "devops3-sg-sql"
  description = "Security group for PostgreSQL cluster"
  network_id  = yandex_vpc_network.devops3-network.id

  ingress {
    description       = "Allow connections from app servers security group"
    protocol          = "ANY"
    security_group_id = yandex_vpc_security_group.devops3-sg-appservers.id
  }

  egress {
    protocol       = "ANY"
    from_port      = 0
    to_port        = 0
    v4_cidr_blocks = ["0.0.0.0/0"]
    description    = "Deny all outbound traffic"
  }

  depends_on = [yandex_vpc_network.devops3-network]
}
