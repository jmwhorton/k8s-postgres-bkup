## k8s-postgres-bkup

This project will schedule a container to run on OpenShift to backup and save a (relatively small) postgres DB to a target location.

### Instructions

1. Add configuration info needed (between angle brackets) in cronjob_template.yaml
    1. Template assumes a secret file that already contains postgres credentials.  If one doesn't exist, just add them to the secret_template.yaml
    2. Adjust the timing of the backups if desired.  Defaults to every day at 2am.
2. Add configuration info needed (between you guessed it, angle brackets) in secret_template.yaml
3. Add the secret to Openshift
    - `oc create -f secret_template.yaml`
4. Add the cronjob to Openshift
    - `oc create -f cronjob_template.yaml`

#### Uninstall

`oc delete cronjob/postgres-bkup`
