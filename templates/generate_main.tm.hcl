generate_hcl "_terramate_generated_main.tf" {
  content {

    resource "random_uuid" "uuid" {}

    locals {
      random_uuid       = random_uuid.uuid.result
      subaccount_domain = lower("${var.subaccount_name}-${local.random_uuid}")
      subaccount_name   = var.subaccount_name
    }

    resource "btp_subaccount" "project" {
      name      = local.subaccount_name
      subdomain = local.subaccount_domain
      region    = lower(var.region)
    }


    module "sap-btp-entitlements" {
      source       = "aydin-ozcan/sap-btp-entitlements/btp"
      version      = "1.0.1"
      subaccount   = btp_subaccount.project.id
      entitlements = var.entitlements
    }
  }
}
