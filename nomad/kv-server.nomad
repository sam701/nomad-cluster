job "kvServer" {
  type = "service"

  datacenters = ["Vagrant-a"]

  group "group1" {
    count = 1

    task "runIt" {
      driver = "docker"

      config {
        image = "sam701/kv-server:latest"

        labels {
          storage = "awesome"
        }
      }

      service {
        name = "kvserver"
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