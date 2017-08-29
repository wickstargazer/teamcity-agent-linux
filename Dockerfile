FROM jetbrains/teamcity-agent:latest

MAINTAINER Wickstargazer <wickyorama@gmail.com>

ENV AWS_REGION "ap-southeast-1"
ENV NODE_ROLE "worker"
RUN apt-get update
RUN apt-get -qy install python-pip
RUN pip install awscli
#RUN mkdir ~/.aws/config \
# echo -e "[default]\nregion=$Env:AWS_REGION" >> ~/.aws/config
RUN echo "teamcity.agent.node.role=$Env:NODE_ROLE" >> /opt/buildagent/conf_dist/buildAgent.properties

RUN echo "teamcity.agent.node.role=$Env:NODE_ROLE" >> /data/teamcity_agent/conf/buildAgent.properties

VOLUME "/opt/buildagent/work"