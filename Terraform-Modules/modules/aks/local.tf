locals {
  nodepool_labels = {
    "0" = {
      environment = "production"
    }
    "1" = {
      environment = "staging"
    }
    "2" = {
      environment = "development"
    }
  }
}
