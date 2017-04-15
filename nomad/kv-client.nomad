job "kvClientJob" {
  type = "service"

  datacenters = ["Vagrant-a"]

  group "group1" {
    count = 2

    task "group1" {
      driver = "docker"

      config {
        image = "sam701/kv-client:latest"

        labels {
          client = "fast"
        }
      }

      service {
        name = "kv-client"
        port = "http"
        tags = ["client"]
      }

      env {
        KV_SERVICE = "kv-server"
        CONSUL_ADDR = "168.254.0.40:8500"
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