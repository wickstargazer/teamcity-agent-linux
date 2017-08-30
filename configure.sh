#!/bin/bash

check() {
   if [[ $? != 0 ]]; then
      echo "Error! Stopping the script."
      exit 1
   fi
}

configure() {
  echo -e "/nteamcity.agent.node.role=${NODE_ROLE}/n" >> /data/teamcity_agent/conf/buildAgent.properties
  #mkdir ~/.aws/config
  #echo -e "[default]\nregion=$Env:AWS_REGION" >> ~/.aws/config
}

AGENT_DIST=/opt/buildagent

CONFIG_DIR=/data/teamcity_agent/conf

LOG_DIR=/opt/buildagent/logs

configure

chmod +x ${AGENT_DIST}/bin/*.sh; check; sync

${AGENT_DIST}/bin/agent.sh start