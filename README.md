# Grafana OnCall Act-Kit

Welcome to the OnCall Act-Kit! This repository offers a collection of terraform
files to get started with managing your OnCall duties as code. Changes are
automatically applied using GitHub Actions.

To use this repository:

0. Fork it to your organization or personal namespace
0. Change the terraform state configuration
0. Set the environment variables to your values:
    + `TF_VAR_grafana_access_token`
    + `TF_VAR_oncall_access_token`
    + `TF_VAR_oncall_url=`
    + `TF_VAR_grafana_url`

  This needs to be done in your respective CI settings or your local env if
  you're running this from your machine.
