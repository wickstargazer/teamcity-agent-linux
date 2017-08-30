FROM jetbrains/teamcity-agent:latest

MAINTAINER Wickstargazer <wickyorama@gmail.com>

COPY configure.sh /configure.sh

ENV AWS_REGION "ap-southeast-1"

RUN apt-get update
RUN apt-get -qy install python-pip
RUN pip install awscli

VOLUME "/opt/buildagent/work"

RUN useradd -m buildagent && \
    chmod +x /configure.sh && sync

CMD [ "/configure.sh"]