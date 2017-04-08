job "kvServerJob" {
  type = "service"

  datacenters = ["Vagrant-a"]

  group "group1" {
    count = 1

    task "group1" {
      driver = "docker"

      config {
        image = "sam701/kv-server:latest"

        labels {
          storage = "awesome"
        }
      }

      constraint {
        attribute = "${node.unique.name}"
        value     = "node1"
      }

      service {
        name = "kv-server"
        port = "http"
        tags = ["tag1"]
      }

      resources {
        memory = 30

        network {
          mbits = 1
          port "http" {}
        }
      }

    }
  }
}