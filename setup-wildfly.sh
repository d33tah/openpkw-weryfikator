#!/bin/sh

. /etc/profile

/wildfly-9.0.1.Final/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0 2>&1 | tee /wildfly-9.0.1.Final/log &

while sleep 1; do
    grep ' started ' /wildfly-9.0.1.Final/log || break
done

/etc/init.d/mysql start

/wildfly-9.0.1.Final/bin/jboss-cli.sh --connect --file=/root/openpkw-weryfikator/openpkw-etc/src/main/etc/wildfly/h2_database.cli
/wildfly-9.0.1.Final/bin/add-user.sh -u admin -p admin
/wildfly-9.0.1.Final/bin/jboss-cli.sh --connect --command="deploy --force /root/openpkw-weryfikator/openpkw-rest/target/openpkw.war"
