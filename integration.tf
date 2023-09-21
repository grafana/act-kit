resource "grafana_oncall_integration" "grafana_cloud" {
  name = "Grafana Cloud Alerts"
  type = "grafana_alerting"
  default_route {
    escalation_chain_id = grafana_oncall_escalation_chain.default.id
  }
}
resource "grafana_contact_point" "grafana_cloud" {
  name = "Grafana Cloud OnCall"
  oncall {
    url = grafana_oncall_integration.grafana_cloud.link
  }
}

resource "grafana_notification_policy" "default" {
  contact_point = grafana_contact_point.grafana_cloud.name
  group_by      = ["grafana_folder", "alertname"]
}
