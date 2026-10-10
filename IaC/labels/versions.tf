terraform {
  required_version = ">=1.6"

  required_providers {
    kubernetes = {
      source  = "opentofu/kubernetes"
      version = "~>3.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/k8s/kubeconfig"
  config_context = null
}
