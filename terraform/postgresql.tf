resource "yandex_mdb_postgresql_cluster" "postgresql588" {
  name        = "postgresql588"
  environment = "PRODUCTION"
  network_id  = yandex_vpc_network.devops3-network.id

  maintenance_window {
    type = "WEEKLY"
    day  = "SAT"
    hour = 22
  }

  config {
    version = 15
    resources {
      resource_preset_id = "c3-c2-m4" # 2 vCPU, 4GB RAM
      disk_type_id       = "network-hdd"
      disk_size          = 10
    }
    
    access {
      data_lens = false
      web_sql   = false
      serverless = false
    }
  }

  host {
    zone             = var.yc_zone
    subnet_id        = yandex_vpc_subnet.devops3-subnet.id
    assign_public_ip = false
  }

  security_group_ids = [yandex_vpc_security_group.devops3-sg-sql.id]
  deletion_protection = false

  depends_on = [yandex_vpc_subnet.devops3-subnet]
}

resource "yandex_mdb_postgresql_user" "db_user" {
  cluster_id = yandex_mdb_postgresql_cluster.postgresql588.id
  name       = var.db_user
  password   = var.db_password

  depends_on = [yandex_mdb_postgresql_cluster.postgresql588]
}

resource "yandex_mdb_postgresql_database" "db" {
  cluster_id = yandex_mdb_postgresql_cluster.postgresql588.id
  name       = var.db_name
  owner      = yandex_mdb_postgresql_user.db_user.name
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"

  depends_on = [yandex_mdb_postgresql_user.db_user]
}