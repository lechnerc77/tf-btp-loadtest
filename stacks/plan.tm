script "plan" {
  job {
    name        = "Terraform Plan"
    description = "Init, validate, and plan a Terraform changes."
    commands = [
      ["terraform", "init"],
      ["terraform", "validate"],
      ["terraform", "plan"],
    ]
  }
}
