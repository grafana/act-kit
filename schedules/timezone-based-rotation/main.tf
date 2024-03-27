terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "2.14.2"
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

variable "start" {
  type    = string
  default = "2024-01-01T00:00:00"
}

output "schedule_id" {
  value = grafana_oncall_schedule.timezone.id
}
