resource "local_file" "kubernetes_config" {
  content = "${digitalocean_kubernetes_cluster.test.kube_config.0.raw_config}"
  filename = "kubeconfig.yaml" 
}