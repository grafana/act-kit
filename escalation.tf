# An escalation chain defines the steps taken to notify on alerts It consists of
# multiple "grafana_oncall_escalation" steps. These can perform various actions
# and are defined below
resource "grafana_oncall_escalation_chain" "default" {
  name = "Notify all"
}

# Notify users from oncall schedule
resource "grafana_oncall_escalation" "notify_oncall" {
  escalation_chain_id          = grafana_oncall_escalation_chain.default.id
  type                         = "notify_on_call_from_schedule"
  notify_on_call_from_schedule = module.schedule.schedule_id
  position                     = 0
}

# You can add further steps below. Make sure to order them correctly using the
# `position` parameter
