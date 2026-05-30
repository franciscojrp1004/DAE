#!/bin/bash

export JBOSS_CLI=$WILDFLY_HOME/bin/jboss-cli.sh

if [ ! -f wildfly.started ]; then
function wait_for_server() {
  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
    echo "Waiting"
    sleep 1
  done
}

echo "************************* >>> Starting WildFly <<< *************************"
$WILDFLY_HOME/bin/standalone.sh -c standalone.xml > /dev/null &
wait_for_server

echo "************************* >>> Setup Datasource <<< *************************"
DB_URL="jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME}"
if [ -n "$DB_SSLMODE" ]; then
    DB_URL="${DB_URL}?sslmode=${DB_SSLMODE}"
fi

$JBOSS_CLI -c << EOF
batch

module add --name=org.postgresql --resources=$WILDFLY_HOME/bin/postgresql-$POSTGRES_DRIVER_VERSION.jar --dependencies=javax.api,javax.transaction.api
/subsystem=datasources/jdbc-driver=postgres:add(driver-name="postgres",driver-module-name="org.postgresql",driver-class-name=org.postgresql.Driver)

data-source add \
  --jndi-name=$DATASOURCE_JNDI \
  --name=$DATASOURCE_NAME \
  --connection-url=$DB_URL \
  --driver-name=postgres \
  --user-name=$DB_USER \
  --password=$DB_PASS \
  --valid-connection-checker-class-name=org.jboss.jca.adapters.jdbc.extensions.postgres.PostgreSQLValidConnectionChecker \
  --exception-sorter-class-name=org.jboss.jca.adapters.jdbc.extensions.postgres.PostgreSQLExceptionSorter

run-batch
EOF

echo "************************* >>> Shutting down WildFly <<< *************************"
$JBOSS_CLI -c ":shutdown"
touch wildfly.started
fi

echo "************************* >>> Starting WildFly <<< *************************"
$WILDFLY_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.http.port=${PORT:-8080}
