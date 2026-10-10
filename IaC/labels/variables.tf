variable "node_labels" {
  type = map(map(string))
  default = {
    "kubes-worker-1" = {
      "intel.feature.node.kubernetes.io/gpu" = "true"
      "intel.feature.node.kubernetes.io/npu" = "true"
      "intel.feature.node.kubernetes.io/dsa" = "true"
      "intel.feature.node.kubernetes.io/qat" = "true"
      "nvidia.com/mps.capable"          = "false"
      "nvidia.com/device-plugin.config" = "ts-4"
      # "nvidia.com/gpu.sharing-strategy"         = "mps"
      # "nvidia.com/gpu.deploy.mps-control-daemon" = "true"
    }
  }
}
