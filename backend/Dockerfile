# Stage 1: Build the WAR using Maven
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Setup WildFly and deploy the WAR
FROM quay.io/wildfly/wildfly:27.0.0.Final-jdk17

ARG WILDFLY_ADMIN_PASSWORD=wildsecret
ARG POSTGRES_DRIVER_VERSION=42.5.4

ENV WILDFLY_HOME=/opt/jboss/wildfly
ENV DEPLOYMENTS_DIR=${WILDFLY_HOME}/standalone/deployments

WORKDIR $WILDFLY_HOME

# Sets Administrator Password
RUN bin/add-user.sh admin $WILDFLY_ADMIN_PASSWORD --silent

# Uses local script to start wildfly server with SSL support
COPY --chown=jboss:root start-wildfly.sh bin/
RUN chmod 771 bin/start-wildfly.sh

# Downloads PostgreSQL Driver
ADD --chown=jboss:root --chmod=664 https://jdbc.postgresql.org/download/postgresql-${POSTGRES_DRIVER_VERSION}.jar bin

# Copy the compiled WAR from the build stage
COPY --from=build /app/target/academics.war ${DEPLOYMENTS_DIR}/

# Starts the Wildfly Web Server
ENTRYPOINT ${WILDFLY_HOME}/bin/start-wildfly.sh
