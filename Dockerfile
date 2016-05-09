FROM oberthur/docker-ubuntu-java:jdk8_8.91.14

MAINTAINER Jakub Dawczynski <j.dawczynski@oberthur.com>

ENV OPENDJ_VERSION=2.6.2 \
    OPENDJ_HOME=/opt/opendj \
    OPENDJ_JAVA_HOME=$JAVA_HOME \
    OPENDJ_JAVA_BIN=$JAVA_HOME/bin/java


RUN set -x && apt-get update \
    && apt-get install -y unzip \
    && cd /opt \
    && curl -o opendj.zip -fSL https://github.com/OpenRock/OpenDJ/releases/download/$OPENDJ_VERSION/opendj-server-$OPENDJ_VERSION.zip \
    && unzip opendj.zip \
    && rm opendj.zip \
    && sed -i 's/# start-ds.java-args=.*/start-ds.java-args=-server -Xms1g -Xmx1g -XX:MaxTenuringThreshold=1 -XX:+UseConcMarkSweepGC -XX:+UseCompressedOops/' /opt/opendj/template/config/java.properties \
    && sed -i 's/# overwrite-env-java-args/overwrite-env-java-args/' /opt/opendj/template/config/java.properties \
    && apt-get purge -y unzip \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY start-opendj.sh /opt/opendj/bin/
ENTRYPOINT ["/opt/opendj/bin/start-opendj.sh"]
