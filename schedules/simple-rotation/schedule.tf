resource "grafana_oncall_schedule" "simple" {
  name      = var.name
  type      = "calendar"
  time_zone = var.time_zone
  shifts = [
    grafana_oncall_on_call_shift.weekly.id,
  ]
}
data "grafana_oncall_user" "all_users" {
  // Extract user info for all users
  for_each = toset(var.team_members)
  username = each.key
}

resource "grafana_oncall_on_call_shift" "weekly" {
  name          = "Default Shift"
  type          = "rolling_users"
  start         = var.start
  duration      = 60 * 60 * 24 * 7 // 7 days
  frequency     = "weekly"
  interval      = 1
  week_start    = "MO"
  by_day        = ["MO"]
  rolling_users = [for oncall_user in data.grafana_oncall_user.all_users : [oncall_user.id]]
  time_zone     = var.time_zone
}
