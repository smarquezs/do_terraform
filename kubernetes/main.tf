resource "digitalocean_kubernetes_cluster" "test" {
  name    = "test"
  region  = "nyc1"
  version = "1.20.2-do.0"

  node_pool {
    name       = "worker-nodes"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 10
  }
}
