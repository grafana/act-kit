terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "2.14.2"
    }
  }
}

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
