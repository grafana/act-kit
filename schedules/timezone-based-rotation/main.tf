terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "2.3.1"
    }
  }
}

variable "team_members_emea" {
  type = list(string)
}
variable "team_members_amer" {
  type = list(string)
}
variable "team_members_apac" {
  type = list(string)
}

variable "time_zone" {
  type    = string
  default = "UTC"
}

variable "start" {
  type    = string
  default = "2023-09-17T00:00:00"
}

output "schedule_id" {
  value = grafana_oncall_schedule.timezone.id
}
