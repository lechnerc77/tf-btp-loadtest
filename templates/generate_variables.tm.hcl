generate_hcl "_terramate_generated_variables.tf" {
  content {
    variable "globalaccount" {
      type        = string
      description = "The globalaccount subdomain where the sub account shall be created."
    }

    variable "region" {
      type        = string
      description = "The region where the account shall be created in."
      default     = "us10"
    }

    variable "subaccount_name" {
      type        = string
      description = "The name of the subaccount."
      default     = "loadtest-${tm_element(terramate.stack.tags, 0)}"
    }

    variable "entitlements" {
      type        = map(list(string))
      description = "Map with all expected entitlements"
      default = {
        # Alert Notification Service
        "alert-notification" = ["standard"]

        # Application Logging Service
        "application-logs" = ["standard=1"]

        # Audit Log
        "auditlog" = ["oauth2=1"]

        # Cloud Management Service
        "cis" = ["system-basic", "xrs"]

        # Connectivity
        "connectivity" = ["connectivity_proxy"]

        # Custom Domain Service
        "INFRA"                 = ["custom_domains=2"] # Custom Domains Service
        "custom-domain-manager" = ["standard=1"]       # Application

        # Job Scheduling Service
        "jobscheduler" = ["standard=1"]

        # SAP HANA Cloud
        "hana-cloud"       = ["hana"]
        "hana-cloud-tools" = ["tools"]

        # SAP HANA Schemas & HDI Containers
        "hana" = ["schema"]

        # Service Manager
        "service-manager" = ["container", "subaccount-audit", "subaccount-admin"]

        # Cloud Foundry Runtime
        # Note: Make sure to use a region where no CF runtime limitations apply.
        #       Therefore no eu10, eu20 and eu10-canary.
        #       See https://wiki.wdf.sap.corp/wiki/x/5orko
        "APPLICATION_RUNTIME" = ["MEMORY=12"]

        # SAP Credential Store Service
        "credstore" = ["small=1"]

        # Dynatrace
        "dynatrace" = ["environment"]
      }
    }
  }
}
