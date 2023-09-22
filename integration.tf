# The Integration is part of OnCall and is a receiver of alerts
resource "grafana_oncall_integration" "grafana_cloud" {
  name = "Grafana Cloud Alerts"
  type = "grafana_alerting"
  default_route {
    escalation_chain_id = grafana_oncall_escalation_chain.default.id
  }
}

# The Contact Point is part of Grafana and sends alerts to the OnCall integration
resource "grafana_contact_point" "oncall" {
  name = "Grafana Cloud OnCall"
  oncall {
    url = grafana_oncall_integration.grafana_cloud.link
  }
}

# This will replace your notification policy with a single entry forwarding
# everything to OnCall
resource "grafana_notification_policy" "default" {
  contact_point = grafana_contact_point.oncall.name
  group_by      = ["grafana_folder", "alertname"]
}
