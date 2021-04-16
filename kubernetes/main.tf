resource "digitalocean_kubernetes_cluster" "test" {
  name    = "test"
  region  = "nyc1"
  version = "1.20.2-do.0"
  node_pool {
    name       = "worker-nodes-4g"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 8
  }
}

resource "digitalocean_kubernetes_node_pool" "databases" {
  cluster_id = digitalocean_kubernetes_cluster.test.id

  name       = "databases-pool"
  size       = "s-4vcpu-8gb"
  node_count = 1
  tags       = ["backend"]

  labels = {
    service  = "db"
    priority = "true"
  }

  taint {
    key    = "db"
    value  = "true"
    effect = "NoSchedule"
  }
}
