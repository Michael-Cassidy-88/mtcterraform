data "terraform_remote_state" "kubeconfig" {
  backend = "remote"

  config = {
    organization = "Michael-Cassidy"
    workspaces = {
      name = "mtc-dev"
    }
  }
}