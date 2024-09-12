// Configure default Terraform version and default providers
globals "terraform" {
  version     = ">= 1.8.0"
  version_dev = ">= 1.8.0"
}

globals "terraform" "providers" "btp" {
  version     = "~> 1.6.0"
  version_dev = "~> 1.6.0"
}
