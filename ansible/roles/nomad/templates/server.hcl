server {
    enabled = true
    bootstrap_expect = 1
}

client {
    enabled = true
    servers = [ "{{node_ip}}" ]
}