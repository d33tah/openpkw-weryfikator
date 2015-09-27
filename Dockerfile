FROM debian:sid
RUN apt-get update
RUN apt-get install -y maven2 openjdk-8-jdk wget unzip
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >> /etc/profile
RUN wget "http://download.jboss.org/wildfly/9.0.1.Final/wildfly-9.0.1.Final.zip" && unzip wildfly-9.0.1.Final.zip
ADD . /root/openpkw-weryfikator
RUN . /etc/profile && echo $JAVA_HOME && cd /root/openpkw-weryfikator && mvn install -e
