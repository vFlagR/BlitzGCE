#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  vFlagR
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
source /opt/blitzgce/functions/main.sh

startserver() {

  ### checking to making sure there is a server deployed to start
  startcheck=$(gcloud compute instances list | grep pg-gce | head -n +1 | awk '{print $1}')
  if [[ "$startcheck" == "" ]]; then

    tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 SYSTEM MESSAGE: No PG-GCE Server Deployed! Exiting!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
    read -p '↘️  Acknowledge Info | Press [ENTER] ' typed </dev/tty
    gcestart
  fi

  ### starting process
  echo
  variablepull
  zone=$(gcloud compute instances list | tail -n 1 | awk '{print $2}')

  tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 SYSTEM MESSAGE: Starting Server - Can Take Awhile!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF

  gcloud compute instances start pg-gce --zone $ipzone --quiet

  tee <<-EOF


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 SYSTEM MESSAGE: Process Complete!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF

  read -p '↘️  Acknowledge Info | Press [ENTER] ' typed </dev/tty
}
