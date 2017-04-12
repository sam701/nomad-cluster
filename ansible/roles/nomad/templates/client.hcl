client {
    enabled = true
    servers = [ "nomad.service.consul" ]
    network_interface = "{{cluster_network_interface}}"
}