resource "grafana_oncall_schedule" "timezone" {
  name      = "Timezone Calendar Schedule"
  type      = "calendar"
  time_zone = "UTC"
  shifts = [
    grafana_oncall_on_call_shift.daytime_emea.id,
    grafana_oncall_on_call_shift.daytime_apac.id,
    grafana_oncall_on_call_shift.daytime_amer.id,
  ]
}
data "grafana_oncall_user" "emea_users" {
  for_each = toset(var.team_members_emea)
  username = each.key
}

data "grafana_oncall_user" "amer_users" {
  for_each = toset(var.team_members_amer)
  username = each.key
}
data "grafana_oncall_user" "apac_users" {
  for_each = toset(var.team_members_apac)
  username = each.key
}

resource "grafana_oncall_on_call_shift" "daytime_amer" {
  name          = "Daytime AMER"
  type          = "rolling_users"
  start         = trim("${timeadd("${var.start}Z", "16h")}", "Z")
  duration      = 60 * 60 * 8 // 7 hours
  frequency     = "weekly"
  interval      = 1
  week_start    = "MO"
  by_day        = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
  rolling_users = [for oncall_user in data.grafana_oncall_user.amer_users : [oncall_user.id]]
  time_zone     = "UTC"
}

resource "grafana_oncall_on_call_shift" "daytime_emea" {
  name          = "Daytime EMEA"
  type          = "rolling_users"
  start         = trim("${timeadd("${var.start}Z", "8h")}", "Z")
  duration      = 60 * 60 * 8 // 7 hours
  frequency     = "weekly"
  interval      = 1
  week_start    = "MO"
  by_day        = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
  rolling_users = [for oncall_user in data.grafana_oncall_user.emea_users : [oncall_user.id]]
  time_zone     = "UTC"
}

resource "grafana_oncall_on_call_shift" "daytime_apac" {
  name          = "Daytime APAC"
  type          = "rolling_users"
  start         = var.start
  duration      = 60 * 60 * 8 // 7 hours
  frequency     = "weekly"
  interval      = 1
  week_start    = "MO"
  by_day        = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
  rolling_users = [for oncall_user in data.grafana_oncall_user.apac_users : [oncall_user.id]]
  time_zone     = "UTC"
}
