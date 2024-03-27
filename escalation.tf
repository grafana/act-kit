resource "grafana_oncall_escalation_chain" "default" {
  name = "Notify all"
}

// Notify users from oncall schedule
resource "grafana_oncall_escalation" "notify_oncall" {
  escalation_chain_id          = grafana_oncall_escalation_chain.default.id
  type                         = "notify_on_call_from_schedule"
  notify_on_call_from_schedule = module.schedule.schedule_id
  position                     = 0
}

// Check out https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/oncall_escalation for possible escalation steps
