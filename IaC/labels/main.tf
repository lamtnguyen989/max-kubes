resource "kubernetes_labels" "node" {
  for_each = var.node_labels

  api_version   = "v1"
  kind          = "Node"
  field_manager = "opentofu-node-labels"
  force         = true

  metadata {
    name = each.key
  }

  labels = each.value
}
