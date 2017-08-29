FROM jetbrains/teamcity-agent:latest

MAINTAINER Wickstargazer <wickyorama@gmail.com>

ENV AWS_REGION "ap-southeast-1"
ENV NODE_ROLE "worker"

RUN apt-get -qy install python-pip
RUN pip install awscli
RUN echo -e "[default]\nregion=$Env:AWS_REGION" >> ~/.aws/config
RUN echo "agent.node.role=$Env:NODE_ROLE" >> /data/teamcity_agent/conf/build.properties

VOLUME "/opt/buildagent/work"