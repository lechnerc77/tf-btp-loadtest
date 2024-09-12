// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

variable "globalaccount" {
  description = "The globalaccount subdomain where the sub account shall be created."
  type        = string
}
variable "region" {
  default     = "us10"
  description = "The region where the account shall be created in."
  type        = string
}
variable "subaccount_name" {
  default     = "loadtest-sbx"
  description = "The name of the subaccount."
  type        = string
}
variable "entitlements" {
  default = {
    APPLICATION_RUNTIME = [
      "MEMORY=12",
    ]
    INFRA = [
      "custom_domains=2",
    ]
    alert-notification = [
      "standard",
    ]
    application-logs = [
      "standard=1",
    ]
    auditlog = [
      "oauth2=1",
    ]
    cis = [
      "system-basic",
      "xrs",
    ]
    connectivity = [
      "connectivity_proxy",
    ]
    credstore = [
      "small=1",
    ]
    custom-domain-manager = [
      "standard=1",
    ]
    dynatrace = [
      "environment",
    ]
    hana = [
      "schema",
    ]
    hana-cloud = [
      "hana",
    ]
    hana-cloud-tools = [
      "tools",
    ]
    jobscheduler = [
      "standard=1",
    ]
    service-manager = [
      "container",
      "subaccount-audit",
      "subaccount-admin",
    ]
  }
  description = "Map with all expected entitlements"
  type        = map(list(string))
}
