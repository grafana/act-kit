terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      # Version > 2.3.1 is required for the automation of the OnCall contact point
      version = "2.3.1"
    }
  }
}

# ================================================================================
# | You need to configure the oncall, as well as the grafana portion since the   |
# | manifests will also create a contact point in grafana alerting.              |
# |                                                                              |
# | If you configure the contact point manually, you can remove the resource in  |
# | the manifests and the `url` and `auth` properties in the provider.           |
# ================================================================================
provider "grafana" {
  oncall_access_token = var.oncall_access_token
  oncall_url          = var.oncall_url

  url  = var.grafana_url
  auth = var.grafana_access_token
}

variable "grafana_url" {
  type = string
}

variable "grafana_access_token" {
  type = string
}

variable "oncall_url" {
  type = string
}

variable "oncall_access_token" {
  type = string
}

# ===============================
# | Choose one of the schedules |
# | below by uncommenting it    |
# ===============================

module "schedule" {
  source = "./schedules/simple-rotation"
  team_members = [
    "dominiksuess",
    "dominiksuessdevextest",
  ]
}

# module "schedule" {
#   source = "./schedules/timezone-based-rotation"
#   team_members_emea = [
#     "dominiksuess",
#   ]
#   team_members_apac = [
#     "dominiksuessapacuser",
#   ]
#   team_members_amer = [
#     "dominiksuessdevextest",
#   ]
# }
