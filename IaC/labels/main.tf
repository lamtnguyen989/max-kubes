variable "node_labels" {
  type = map(map(string))
  default = {
    "kubes-worker-1" = {
      "intel.feature.node.kubernetes.io/gpu" = "true"
      "intel.feature.node.kubernetes.io/npu" = "true"
      # "intel.feature.node.kubernetes.io/dsa" = "true"
      "intel.feature.node.kubernetes.io/qat" = "true"
      "nvidia.com/mps.capable"          = "false"
      "nvidia.com/device-plugin.config" = "ts-4"
      # "nvidia.com/gpu.sharing-strategy"         = "mps"
      # "nvidia.com/gpu.deploy.mps-control-daemon" = "true"
    }
  }
}


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
