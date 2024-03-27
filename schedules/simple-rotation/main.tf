terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "2.14.2"
    }
  }
}

variable "name" {
  type    = string
  default = "Example Calendar Schedule"
}

variable "team_members" {
  type = list(string)
}

variable "time_zone" {
  type    = string
  default = "Europe/Vienna"
}

variable "start" {
  type    = string
  default = "2024-01-01T00:00:00"
}

output "schedule_id" {
  value = grafana_oncall_schedule.simple.id
}
