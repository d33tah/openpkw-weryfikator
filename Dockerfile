FROM debian:sid
RUN echo 'mysql-server mysql-server/root_password password root' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections
RUN apt-get update && apt-get install -y maven2 openjdk-8-jdk wget unzip mysql-server
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >> /etc/profile
RUN wget "http://download.jboss.org/wildfly/9.0.1.Final/wildfly-9.0.1.Final.zip" && unzip wildfly-9.0.1.Final.zip
ADD . /root/openpkw-weryfikator
RUN . /etc/profile && echo $JAVA_HOME && cd /root/openpkw-weryfikator && mvn install -e
RUN /root/openpkw-weryfikator/setup-wildfly.sh
