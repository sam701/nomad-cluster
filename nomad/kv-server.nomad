job "kvServerJob" {
  type = "service"

  datacenters = ["Vagrant-a"]

  group "group1" {
    count = 1

    task "group1" {
      driver = "docker"

      config {
        image = "sam701/kv-server:latest"

        command = "kv-server"
        args = [
          "--host-port",
          ":${NOMAD_PORT_grpc}"
        ]

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
        port = "grpc"
        tags = ["tag1"]
      }

      resources {
        memory = 100

        network {
          mbits = 1
          port "grpc" {}
        }
      }

    }
  }
}