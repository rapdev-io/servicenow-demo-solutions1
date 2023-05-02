provider "aws" {}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}