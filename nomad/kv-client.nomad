job "kvClientJob" {
  type = "service"

  datacenters = ["Vagrant-a"]

  group "group1" {
    count = 2

    task "group1" {
      driver = "docker"

      config {
        image = "sam701/kv-client:latest"

        command = "kv-client"
        args = [
          "--consul", "169.254.0.40:8500",
          "--kv-service", "kv-server",
          "--listen", ":${NOMAD_PORT_http}"
        ]

        labels {
          client = "fast"
        }
      }

      service {
        name = "kv-client"
        port = "http"
        tags = ["client"]
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