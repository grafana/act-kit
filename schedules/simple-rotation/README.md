# Simple Rotation

This rotation switches the active person on call on a weekly basis.

The following configuration options are available for this module:

* `team_members`: a list of Grafana user names. These users will be part of the rotation
* `time_zone`: time zone to use for this schedule. Defaults to `Europe/Vienna`
* `start`: start date and time. The start time is also the time at which the handover happens. Defaults to `2024-01-01T00:00:00`

It provides the `schedule_id` as an output to be used in escalation steps.
