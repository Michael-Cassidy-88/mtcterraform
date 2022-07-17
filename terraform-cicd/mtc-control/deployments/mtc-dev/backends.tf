terraform {
  backend "remote" {
    organization = "Michael-Cassidy"

    workspaces {
      name = "mtc-dev-repo"
    }
  }
}