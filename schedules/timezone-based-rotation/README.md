# Timezone Based Rotation

This rotation rotates users based on their geographical location.
Each user from each region stays in the schedule for one week before rotating.

The following configuration options are available for this module:

* `team_members_{emea,amer,apac}`: List of users in the respective regions.
* `start`: start date and time. The time can be used to finetune the shift start date. Defaults to `2024-01-01T00:00:00`.

It provides the `schedule_id` as an output to be used in escalation steps.
