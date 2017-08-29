FROM jetbrains/teamcity-agent:latest

MAINTAINER Wickstargazer <wickyorama@gmail.com>

ENV AWS_REGION "ap-southeast-1"
ENV NODE_ROLE "worker"

RUN apt-get update
RUN apt-get -qy install python-pip
RUN pip install awscli

VOLUME "/opt/buildagent/work"

CMD [ "/configure.sh"]