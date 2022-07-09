terraform {
  cloud {
    organization = "Michael-Cassidy"

    workspaces {
      name = "mtc-k8s"
    }
  }
}