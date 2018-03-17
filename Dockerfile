FROM microsoft/aspnetcore:2.0.6

MAINTAINER Burak Ince <burak.ince@linux.org.tr>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        tar \
        supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.0.0-amd64.deb \
    && dpkg -i filebeat-6.0.0-amd64.deb \
    && rm filebeat-6.0.0-amd64.deb
