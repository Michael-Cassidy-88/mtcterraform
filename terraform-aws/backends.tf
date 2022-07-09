terraform {
  cloud {
    organization = "Michael-Cassidy"

    workspaces {
      name = "mtc-dev"
    }
  }
}