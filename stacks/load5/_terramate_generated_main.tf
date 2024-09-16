// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "random_uuid" "uuid" {
}
locals {
  random_uuid       = random_uuid.uuid.result
  subaccount_domain = lower("${var.subaccount_name}-${local.random_uuid}")
  subaccount_name   = var.subaccount_name
}
resource "btp_subaccount" "project" {
  name      = local.subaccount_name
  region    = lower(var.region)
  subdomain = local.subaccount_domain
}
module "sap-btp-entitlements" {
  entitlements = var.entitlements
  source       = "aydin-ozcan/sap-btp-entitlements/btp"
  subaccount   = btp_subaccount.project.id
  version      = "1.0.1"
}
