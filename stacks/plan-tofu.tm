script "plan-tofu" {
  job {
    name        = "Tofu Plan"
    description = "Init, validate, and plan a Terraform changes."
    commands = [
      ["tofu", "init"],
      ["tofu", "validate"],
      ["tofu", "plan"],
    ]
  }
}
